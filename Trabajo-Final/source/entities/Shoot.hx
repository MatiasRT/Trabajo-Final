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
		
		/*if (y>Reg.limiteY+FlxG.height) 
			kill();
		
		if (x<0) 
		{
			kill();
		}*///El disparo no muere cuando esta fuera de la pantalla.
	}
}