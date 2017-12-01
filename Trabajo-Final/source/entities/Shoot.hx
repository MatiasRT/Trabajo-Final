package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Matias Ruiz Torres
 */
class Shoot extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(10, 10, FlxColor.WHITE);
	}
	
	override public function update (elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (y > FlxG.camera.scroll.y + FlxG.height)
			destroy();
		if (y < FlxG.camera.scroll.y)
			destroy();
	}
}