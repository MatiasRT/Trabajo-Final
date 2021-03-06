package states;

import entities.BossShoot;
import entities.Shoot;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.addons.effects.FlxTrail;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import entities.Player;
import entities.Guide;
import entities.Enemy;
import entities.Enemy1;
import entities.Enemy2;
import entities.Enemy3;
import entities.Boss;
import entities.PowerUps;

class PlayState extends FlxState
{
	private var player:Player;
	private var loader:FlxOgmoLoader;
	private var tileMap:FlxTilemap;
	private var guide:Guide;
	private var enemies:FlxTypedGroup<Enemy>;
	private var enemiesFollow:FlxTypedGroup<Enemy2>;
	private var enemiesTween:FlxTypedGroup<Enemy3>;
	private var boss:Boss;
	private var eShoot:FlxTypedGroup<Shoot>;
	private var score:FlxText;
	private var puntos:Int;
	private var powerUps:FlxTypedGroup<PowerUps>;
	private var powerupsBar:FlxBar;
	private var bossBar:FlxBar;
	private var bShoot:FlxTypedGroup<BossShoot>;
	private var background:FlxBackdrop;
	
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		
		/* OGMO */
		loader = new FlxOgmoLoader(AssetPaths.level__oel);
		tileMap = loader.loadTilemap(AssetPaths.Tiles_TP_Final__png, 16, 16, "Tiles");
		
		/* PLAYER */
		powerUps = new FlxTypedGroup<PowerUps>();
		
		/* ENEMY */
		eShoot = new FlxTypedGroup<Shoot>();
		bShoot = new FlxTypedGroup<BossShoot>();
		enemies = new FlxTypedGroup<Enemy>();
		enemiesFollow = new FlxTypedGroup<Enemy2>();
		enemiesTween = new FlxTypedGroup<Enemy3>();
		boss = new Boss(bShoot);
		
		/* COLLISION */
		FlxG.worldBounds.set(0, 0, tileMap.width, tileMap.height);
		
		/* HUD */
		score = new FlxText (0, 0, 0, "SCORE", 16);
		score.scrollFactor.x = 0;
		score.scrollFactor.y = 0;
		puntos = 0;
		background = new FlxBackdrop(AssetPaths.Fondo__png);
		
		/* MUSIC */
		FlxG.sound.play(AssetPaths.Star_wars_playstate__ogg, 1, true);
		
		/* ADDS */
		add(background);
		add(tileMap);
		add(score);
		
		/* ENTITY CREATOR */
		loader.loadEntities(entityCreator, "Entities");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		Reg.limiteY += Reg.velCamera * elapsed;
		FlxG.collide(enemies, player.get_bullets(), collideShootEnemy1);
		FlxG.collide(enemiesFollow, player.get_bullets(), collideShootEnemy2);
		FlxG.collide(enemiesTween, player.get_bullets(), collideShootEnemy3);
		FlxG.overlap(boss, player.get_bullets(), collideShootBoss);
		FlxG.collide(powerUps, player, collidePlayerPowerUps);
		FlxG.collide(enemies, player, collideEnemyPlayer);
		FlxG.collide(eShoot, player, collideEnemyshootPlayer);
		FlxG.collide(boss, player, collideBossPlayer);
		FlxG.collide(enemiesFollow, player, collideEnemy2Player);
		FlxG.collide(enemiesTween, player, collideEnemy3Player);
		FlxG.collide(bShoot, player, collideBossBulletPlayer);
		scoreInScreen();
		bossBattle();
		checkLose();
		enemiesFollow.forEachAlive(checkEnemyVision);
		player.get_guide(guide);
		if (FlxG.keys.justPressed.R)
			FlxG.resetState();
		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(new MenuState());
		if (FlxG.keys.justPressed.P)
			pauseState();
	}
	
	/* SUBSTATE */
	private function pauseState():Void
	{
		var substate:PauseSubState = new PauseSubState(FlxColor.TRANSPARENT);
		openSubState(substate);
	}
	
	/* VISION FOR ENEMY 2 (ENEMYFOLLOW) */
	private function checkEnemyVision(e:Enemy2):Void
	{
		if (tileMap.ray(e.getMidpoint(), player.getMidpoint()))
		{
			e.seesPlayer = true;
			e.playerPos.copyFrom(player.getMidpoint());
		}
		else
			e.seesPlayer = false;
	}
	
	private function entityCreator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		switch (entityName)
		{
			case "Player":
				player = new Player(guide);
				player.x = x;
				player.y = y;
				add(player);
			
			case "Enemy-1":
				var enemy1 = new Enemy1(powerUps, eShoot);
				enemy1.x = x;
				enemy1.y = y;
				enemies.add(enemy1);
				add(enemies);
			
			case "Enemy-2":
				var enemy2 = new Enemy2(powerUps);
				enemy2.x = x;
				enemy2.y = y;
				enemiesFollow.add(enemy2);
				add(enemiesFollow);
			
			case "Enemy-3":
				var enemy3 = new Enemy3(powerUps, x, y);
				enemiesTween.add(enemy3);
				add(enemiesTween);
			
			case "Boss":
				boss.x = x;
				boss.y = y;
				add(boss);
			
			case "Guide":
				guide = new Guide(x , y);
				add(guide);
				FlxG.camera.follow(guide);
		}
	}
	
	/* ENEMIES COLLISION WITH PLAYER BULLETS */
	private function collideShootEnemy1(e:Enemy, s:Shoot):Void
	{
		e.dropPowerUp();
		enemies.remove(e, true);
		player.get_bullets().remove(s, true);
		scoreMeter();
	}
	
	private function collideShootEnemy2(e:Enemy2, s:Shoot):Void
	{
		e.dropPowerUp();
		enemiesFollow.remove(e, true);
		player.get_bullets().remove(s, true);
		scoreMeter();
	}
	
	private function collideShootEnemy3(e:Enemy3, s:Shoot):Void
	{
		e.dropPowerUp();
		enemiesTween.remove(e, true);
		player.get_bullets().remove(s, true);
		scoreMeter();
	}
	
	private function collideShootBoss(b:Boss, s:Shoot):Void
	{
		b.loseLives();
		player.get_bullets().remove(s, true);
		if (boss.get_vidas() == 0)
		{
			scoreMeter();
			boss.kill();
			if (puntos > Reg.highscore)
				Reg.highscore = puntos;
			FlxG.switchState(new WinState());
		}
	}
	
	/* PLAYER COLLISION WITH ENEMIES */
	private function collideEnemyPlayer(e:Enemy, p:Player)
	{
		enemies.remove(e, true);
		player.die();
	}
	
	private function collideEnemyshootPlayer(s:Shoot, p:Player):Void
	{
		eShoot.remove(s, true);
		player.die();
	}
	
	private function collideEnemy2Player(e:Enemy2, p:Player):Void
	{
		enemiesFollow.remove(e, true);
		player.die();
	}
	
	private function collideEnemy3Player(e:Enemy3, p:Player):Void
	{
		enemiesTween.remove(e, true);
		player.die();
	}
	
	private function collideBossPlayer(b:Boss, p:Player):Void
	{
		player.die();
	}
	
	private function collideBossBulletPlayer(b:BossShoot, p:Player):Void
	{
		bShoot.remove(b, true);
		player.die();
	}
	
	
	/* CHECK IF PLAYER IS DEAD */
	private function checkLose():Void
	{
		if (player.get_lives()<=0)
		{
			FlxG.switchState(new LoseState());
		}
	}
	
	/* PLAYER COLISSION WITH OBJECTS */
	private function collidePlayerPowerUps(pU:PowerUps, p:Player):Void
	{
		powerUps.remove(pU, true );
		player.getPowerUp();
	}
	
	/* HUD */
	public function scoreInScreen()
	{
		score.text = "SCORE " + puntos;
	}
	
	public function scoreMeter()
	{
		puntos += 100;
	}
	
	/* BOSS BATTLE */
	public function bossBattle()
	{
		if (FlxG.overlap(guide, boss))
		{
			bossBar = new FlxBar(0, 700, FlxBarFillDirection.LEFT_TO_RIGHT, 640, 20, boss, "vidas", 0, 200, true);
			bossBar.scrollFactor.x = 0;
			bossBar.scrollFactor.y = 0;
			guide.velocity.y = 0;
			boss.velocity.x = -50;
			guide.kill();
			player.verificator();
			add(bossBar);
		}
	}
}