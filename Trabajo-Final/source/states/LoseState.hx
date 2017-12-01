package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ...
 */
class LoseState extends FlxState 
{

	override public function create()
	{
		FlxG.mouse.visible = true;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		var restart = new FlxButton(x, 300, "Restart the Game", returnToGame);
		
		var botonSalir = new FlxButton(x, 400, "Exit Game", salida);
		
		add(restart);
		add(botonSalir);
	}
	
	private function returnToGame()
	{
		FlxG.switchState(new PlayState());
	}
	
	private function salida()
	{
		FlxG.switchState(new MenuState());
	}
	
	
}