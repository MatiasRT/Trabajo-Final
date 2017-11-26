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
	/*private var  verif:Bool;*/
	
	public function new(g:Guide,?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		guide = g;
		makeGraphic(16, 16, FlxColor.WHITE);
		bullets = new FlxTypedGroup<Shoot>();
		/*verif = false;*/
		updateHitbox();
	}
	
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		/*
		if (!verif)
			velocity.set(Reg.velCamera, 0);
		else
			velocity.set(0, 0);
		*/
		movement();
		shoot();
	}
	
	/*public function verificador()
	{
		verif = true;
	}*/
	
	private function movement():Void
	{
		if (FlxG.keys.pressed.RIGHT)
		{	
			if (this.x < Reg.limiteX + FlxG.width - this.width)
			{	
				velocity.x += Reg.velPlayer;
			}
		}
		
		if (FlxG.keys.pressed.LEFT)
		{
			if (this.x>Reg.limiteX)
			{
				velocity.x -= Reg.velPlayer;
			}
		}
		
		if (FlxG.keys.pressed.UP)
		{
			if (y > 0)
			{
				velocity.y -= Reg.velPlayer;
			}
		}
		
		if (FlxG.keys.pressed.DOWN)
		{	
			if (y<FlxG.height-this.height)
			{
				velocity.y += Reg.velPlayer;
			}
		}
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