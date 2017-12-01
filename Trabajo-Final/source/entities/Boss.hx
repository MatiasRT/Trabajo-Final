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
	private var bossBullets:FlxTypedGroup<BossShoot>;
	
	public function new(bB:FlxTypedGroup<BossShoot>,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		bossBullets = bB;
		makeGraphic(16, 16, FlxColor.GREEN);
		loadGraphic(AssetPaths.Death_Star__png, false, 1500, 1500);
		timer = 0;
		vidas = 200;
		//height = height / 2;
		//offset.y = 300;
	}
	
	override public function update(elapsed:Float):Void
	{
		if (isOnScreen())
		{
			super.update(elapsed);
			movement();
			shoot(elapsed);
			timer += 1;
		}
	}
	
	function movement():Void
	{
		if (x > FlxG.width - width)
			velocity.x -= 50;
		
		if (x <= 0)
		velocity.x += 50;
	}
	
	private function shoot(elapsed:Float):Void
	{
		if ((FlxG.camera.scroll.x + FlxG.camera.width) > this.x && timer>80)
		{
			var bullet = new BossShoot(this.x+this.width/2, this.y+this.height/2);
			bossBullets.add(bullet);
			FlxG.state.add(bossBullets);
			bullet.velocity.y = -Reg.velBullet;
			timer = 0;
		}
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