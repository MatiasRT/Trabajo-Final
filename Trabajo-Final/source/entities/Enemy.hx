package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Matias Ruiz Torres
 */
class Enemy extends FlxSprite 
{
	private var timer:Float;
	private var timerPU:Int;
	private var powerUps:FlxTypedGroup<PowerUps>;
	public function new(pU:FlxTypedGroup<PowerUps>,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		powerUps = pU;
		timer = 0;
		timerPU = 0;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timerPU += 1;
		if (timerPU > 50)
			timerPU = 0;
	}
	
	public function dropPowerUp():Void
	{
		if (timerPU % 5 == 0)
		{
			var powerUp = new PowerUps(this.x, this.y);
			powerUps.add(powerUp);
			FlxG.state.add(powerUps);
		}
	}
	
}