package entities;

import entities.Player.States;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import entities.Shoot;
import entities.Guide;

/**
 * ...
 * @author Matias Ruiz Torres
 */
enum States
{
	IDLE;
	FLYING;
}
 
class Player extends FlxSprite 
{
	private var bullets(get, null):FlxTypedGroup<Shoot>;
	private var guide:Guide;
	private var powerUp(get, null):Int;
	private var pU:PowerUps;
	private var doubleShoot:Bool;
	private var  verif:Bool;
	public var currentState(get, null):States;
	
	public function new(g:Guide,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		guide = g;
		loadGraphic(AssetPaths.Xwing__png, true, 64, 64);
		animation.add("idle", [0], 1, false);
		animation.add("flying", [1, 2], 1, false);
		scale.set(1.5, 1.5);
		bullets = new FlxTypedGroup<Shoot>();
		pU = new PowerUps();
		doubleShoot = false;
		verif = false;
		updateHitbox();
		powerUp = 0;
		height = height / 2;
		offset.y = 20;
		currentState = States.IDLE;
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (!verif)
			velocity.set(0, Reg.velCamera);
		else
			velocity.set(0, 0);
		stateMachine();
	}
	
	private function stateMachine():Void
	{
		switch(currentState)
		{
			case States.IDLE:
				shoot();
				movement();
				activatePowerUp();
				animation.play("idle");
				if (velocity.x != 0)
					currentState = States.FLYING;
			
			case States.FLYING:
				shoot();
				movement();
				activatePowerUp();
				animation.play("flying");
				if (velocity.x == 0)
					currentState = States.IDLE;
		}
	}
	
	public function verificator()
	{
		verif = true;
	}
	
	private function movement():Void
	{
		if (FlxG.keys.pressed.RIGHT)
		{	
			if (this.x < Reg.limiteX + FlxG.width - this.width)
			{	
				velocity.x += Reg.velPlayer;
			}
		}
		
		if (FlxG.keys.pressed.LEFT)
		{
			if (this.x>Reg.limiteX)
			{
				velocity.x -= Reg.velPlayer;
			}
		}
		
		/*if (FlxG.keys.pressed.UP)
		{
			if (y > 0)
			{
				velocity.y -= Reg.velPlayer;
			}
		}
		
		if (FlxG.keys.pressed.DOWN)
		{	
			if (y<FlxG.height-this.height)
			{
				velocity.y += Reg.velPlayer;
			}
		}*/
	}
	
	private function shoot():Void
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			var bullet = new Shoot(this.x + 42, this.y - 40);
			bullets.add(bullet);
			FlxG.state.add(bullets);
			
			bullet.velocity.y = Reg.velBullet;
			
			if (doubleShoot == true)
			{
				var doubleBullet1 = new Shoot(this.x + 84, this.y + 40);
				var doubleBullet2 = new Shoot(this.x + 2, this.y + 40);
				bullets.add(doubleBullet1);
				bullets.add(doubleBullet2);
				FlxG.state.add(bullets);
				doubleBullet1.velocity.y = Reg.velBulletDoubleY;
				doubleBullet2.velocity.y = Reg.velBulletDoubleY;
			}
		}
		
	}
	
	private function activatePowerUp():Void
	{
		if (FlxG.keys.justPressed.Z)
		{
			if (powerUp == 1)
				pU.speedUp();
			
			if (powerUp == 2)
				doubleShoot = true;
			
			powerUp = 0;
		}
	}
	
	public function getPowerUp():Void
	{
		powerUp += 1;
	}
	
	public function get_powerUp():Int
	{
		return powerUp;
	}
	
	public function get_bullets():FlxTypedGroup<Shoot>
	{
		return bullets;
	}
	
	public function get_guide(g:Guide)
	{
		guide = g;
	}
	function get_currentState():States 
	{
		return currentState;
	}
}