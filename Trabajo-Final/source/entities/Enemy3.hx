package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Enemy3 extends Enemy 
{

	public function new(pU:FlxTypedGroup<PowerUps>,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(pU,X, Y, SimpleGraphic);
		makeGraphic(16, 16, FlxColor.WHITE);
		movement();
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	public function movement():Void
	{
		velocity.y = 50;
		var v = x + 35;
		FlxTween.tween(this, {x:v}, 0.5, {type:FlxTween.PINGPONG, ease: FlxEase.sineInOut});
	}
	
}