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
		loadGraphic(AssetPaths.Death_Star__png, false, 1500, 1500);
		//scale.set(0.5, 0.5);
		timer = 0;
		vidas = 100;
		//height = height / 2;
		//offset.y = 300;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movement();
		timer += 1;
	}
	
	function movement():Void
	{
		if (x > FlxG.width - width)
			velocity.x -= 50;
		
		if (x <= 0)
		velocity.x += 50;
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