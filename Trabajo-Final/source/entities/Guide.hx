package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Matias Ruiz Torres
 */
class Guide extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(1, 1, FlxColor.BROWN);
		velocity.y = Reg.velCamera;
		//velocity.y = -600;
	}

	override function update (elapsed:Float):Void
	{
		super.update(elapsed);
	}
}