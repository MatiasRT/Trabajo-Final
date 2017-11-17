package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Matias Ruiz Torres
 */
class Enemy extends FlxSprite 
{
	private var timer:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		timer = 0;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}