package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class LoseState extends FlxState 
{

	override public function create()
	{
		FlxG.mouse.visible = true;
		bgColor = FlxColor.BLACK;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		var perdiste = new FlxText (35, 20, 0, "¡You Lose!", 28); 
		var restart = new FlxButton(x, 300, "Restart", returnToGame);
		var lose = new FlxSprite(x - 215, 100, AssetPaths.Sith__png);
		var botonSalir = new FlxButton(x, 400, "Exit Game", salida);
		FlxG.sound.play(AssetPaths.Star_wars_lose__ogg, 1, true);
		add(lose);
		add(restart);
		add(botonSalir);
		add(perdiste);
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