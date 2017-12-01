package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Matias Ruiz Torres
 */
class PowerUps extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		//makeGraphic(10, 10, FlxColor.ORANGE);
		loadGraphic(AssetPaths.Powerup__png, true, 16, 16);
		animation.add("idle", [1, 2], 2, true);
	}
	
	override function update (elapsed:Float):Void
	{
		super.update(elapsed);
		animation.play("idle");
	}
	
	public function speedUp():Void
	{
		if (Reg.velPlayer <= 600)
			Reg.velPlayer += 300;
		
	}
	
	
}