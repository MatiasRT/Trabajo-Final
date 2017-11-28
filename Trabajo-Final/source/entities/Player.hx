package entities;

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
class Player extends FlxSprite 
{
	private var bullets(get, null):FlxTypedGroup<Shoot>;
	private var guide:Guide;
	private var powerUp(get, null):Int;
	private var pU:PowerUps;
	private var doubleShoot:Bool;
	private var  verif:Bool;
	
	public function new(g:Guide,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		guide = g;
		makeGraphic(16, 16, FlxColor.WHITE);
		bullets = new FlxTypedGroup<Shoot>();
		pU = new PowerUps();
		doubleShoot = false;
		verif = false;
		updateHitbox();
		powerUp = 0;
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (!verif)
			velocity.set(0, -80);
		else
			velocity.set(0, 0);
		movement();
		shoot();
		activatePowerUp();
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
			var bullet = new Shoot(this.x + 3, this.y + 5);
			bullets.add(bullet);
			FlxG.state.add(bullets);
			
			bullet.velocity.y = Reg.velBullet;
			
			if (doubleShoot == true)
			{
				var doubleBullet1 = new Shoot(this.x + 40, this.y + 5);
				var doubleBullet2 = new Shoot(this.x - 40, this.y + 5);
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
}