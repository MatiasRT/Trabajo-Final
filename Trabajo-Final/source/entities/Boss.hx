package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxMath;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
/**
 * ...
 * @author Matias Ruiz Torres
 */
class Boss extends FlxSprite 
{
	private var timer:Float;
	public var vidas(get, null):Int;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16, FlxColor.GREEN);
		velocity.x = -10;
		timer = 0;
		vidas = 100;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movement();
		timer += 1;
	}
	
	function movement():Void
	{
		if (x > FlxG.width - 24 - width)
			velocity.x -= 10;
		
		if (x <= 0)
		velocity.y += 10;
	}
	
	public function loseLives():Void
	{
		vidas -= 1;
	}
	
	public function get_vidas():Int
	{
		return vidas;
	}
}