package states;

import entities.Shoot;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import entities.Player;
import entities.Guide;
import entities.Enemy;
import entities.Enemy1;
import entities.Enemy2;
import entities.Enemy3;

class PlayState extends FlxState
{
	private var player:Player;
	private var loader:FlxOgmoLoader;
	private var tileMap:FlxTilemap;
	private var guide:Guide;
	private var enemies:FlxTypedGroup<Enemy>;
	private var enemiesFollow:FlxTypedGroup<Enemy2>;
	private var enemiesTween:FlxTypedGroup<Enemy3>;
	private var eShoot:FlxTypedGroup<Shoot>;
	
	override public function create():Void
	{
		super.create();
		
		/* OGMO */
		loader = new FlxOgmoLoader(AssetPaths.level__oel);
		tileMap = loader.loadTilemap(AssetPaths.Tiles_TP_Final__png, 16, 16, "Tiles");
		bgColor = FlxColor.BLUE;
		
		
		/* GUIDE */
		/*guide = new Guide(FlxG.width / 2 , FlxG.height / 2);*/
		guide = new Guide(FlxG.width / 2 , 9630);
		guide.velocity.y = Reg.velCamera;
		FlxG.camera.follow(guide);
		
		/* ENEMY */
		eShoot = new FlxTypedGroup<Shoot>();
		enemies = new FlxTypedGroup<Enemy>();
		enemiesFollow = new FlxTypedGroup<Enemy2>();
		enemiesTween = new FlxTypedGroup<Enemy3>();
		
		/* COLLISION */
		FlxG.worldBounds.set(0, 0, tileMap.width, tileMap.height);
		
		/* ADDS */
		add(guide);
		add(tileMap);
		
		/* ENTITY CREATOR */
		loader.loadEntities(entityCreator, "Entities");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(enemies, player.get_bullets(), collideShootEnemy1);
		FlxG.collide(enemiesFollow, player.get_bullets(), collideShootEnemy2);
		FlxG.collide(enemiesTween, player.get_bullets(), collideShootEnemy3);
		/*FlxG.collide(player, tileMap);*/
		enemiesFollow.forEachAlive(checkEnemyVision);
		player.get_guide(guide);
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
				var enemy1 = new Enemy1(eShoot);
				enemy1.x = x;
				enemy1.y = y;
				enemies.add(enemy1);
				add(enemies);
			
			case "Enemy-2":
				var enemy2 = new Enemy2();
				enemy2.x = x;
				enemy2.y = y;
				enemiesFollow.add(enemy2);
				add(enemiesFollow);
			
			case "Enemy-3":
				var enemy3 = new Enemy3(x, y);
				enemiesTween.add(enemy3);
				add(enemiesTween);
		}
	}
	
	/* ENEMIES COLLISION WITH PLAYER BULLETS */
	private function collideShootEnemy1(e:Enemy, s:Shoot):Void //Fijarse los worldbounds, que estan jodiendo y el disparo tmb.
	{
		enemies.remove(e, true);
		player.get_bullets().remove(s, true);
	}
	
	private function collideShootEnemy2(e:Enemy2, s:Shoot):Void
	{
		enemiesFollow.remove(e, true);
		player.get_bullets().remove(s, true);
	}
	
	private function collideShootEnemy3(e:Enemy3, s:Shoot):Void
	{
		enemiesTween.remove(e, true);
		player.get_bullets().remove(s, true);
	}
}