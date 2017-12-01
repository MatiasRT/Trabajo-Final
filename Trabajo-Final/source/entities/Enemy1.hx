package entities;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Matias Ruiz Torres
 */
class Enemy1 extends Enemy 
{
	public var yOriginal:Float;
	private var eShoot:FlxTypedGroup<Shoot>;
	
	public function new(pU:FlxTypedGroup<PowerUps>,eS:FlxTypedGroup<Shoot>,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(pU,X, Y, SimpleGraphic);
		eShoot = eS;
		makeGraphic(16, 16, FlxColor.RED);
		loadGraphic(AssetPaths.Enemy1__png, false, 64, 64);
		yOriginal = Y;
		velocity.y = Reg.velEnemy;
		updateHitbox();
	}
	
	override public function update(elapsed:Float):Void
	{
		if (isOnScreen())
		{
			super.update(elapsed);
			movement();
			shoot(elapsed);
			timer++;
		}
	}
	
	private function movement()
	{
		if (x < yOriginal)
		{
			velocity.y = -velocity.y;
			x = x + 30;
		}
	}
	
	private function  shoot(elapsed:Float):Void
	{
		if ((FlxG.camera.scroll.x + FlxG.camera.width) > this.x && timer>80)
		{
			var bullet = new Shoot(this.x+this.width/2, this.y+this.height/2);
			eShoot.add(bullet);
			FlxG.state.add(eShoot);
			bullet.velocity.y = -Reg.velBullet;
			timer = 0;
		}
	}
}