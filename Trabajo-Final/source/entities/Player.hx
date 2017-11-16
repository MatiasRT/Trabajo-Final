package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import entities.Shoot;
import entities.Guide;

/**
 * ...
 * @author Matias Ruiz Torres
 */
class Player extends FlxSprite 
{
	private var bullets(get, null):FlxTypedGroup<Shoot>;
	private var guide:Guide;
	
	public function new(g:Guide,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		guide = g;
		makeGraphic(16, 16, FlxColor.WHITE);
		bullets = new FlxTypedGroup<Shoot>();
		updateHitbox();
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		movement();
		shoot();
	}
	
	private function movement():Void
	{
		if (FlxG.keys.pressed.RIGHT)
			velocity.x += 10;
		if (FlxG.keys.pressed.LEFT)
			velocity.x -= 10;
		if (FlxG.keys.pressed.UP)
			velocity.y -= 10;
		if (FlxG.keys.pressed.DOWN)
			velocity.y += 10;
	}
	
	private function shoot():Void
	{
		
		if (FlxG.keys.justPressed.SPACE)
		{
			var bullet = new Shoot(this.x + 5, this.y + 5);
			bullets.add(bullet);
			FlxG.state.add(bullets);
			
			bullet.velocity.y = Reg.velBullet;
			
		}
		
	}
	
	public function get_bullets():FlxTypedGroup<Shoot>
	{
		return bullets;
	}
	
	public function get_guide(g:Guide)
	{
		guide = g;
	}
}