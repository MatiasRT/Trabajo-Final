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
		makeGraphic(10, 10, FlxColor.ORANGE);
	}
	
	override function update (elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	public function speedUp():Void
	{
		if (Reg.velPlayer <= 400)
			Reg.velPlayer += 200;
		
	}
	
	
}