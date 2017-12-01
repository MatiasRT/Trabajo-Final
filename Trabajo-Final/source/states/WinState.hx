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
class WinState extends FlxState 
{

	private var ganaste:FlxText;
	private var highscore:FlxText;
	
	override public function create() 
	{
		FlxG.mouse.visible = true;
		bgColor = FlxColor.CYAN;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		ganaste = new FlxText (35, 20, 0, "¡You Win!", 28); 
		var win = new FlxSprite(x - 450 , 50, AssetPaths.Jedi__png);
		var botonNuevoJuego = new FlxButton(x, 100, "Go to Menu", menu);
		highscore = new FlxText(40, 200, 0, "HighScore: " + Reg.highscore, 14);
		add(win);
		add(botonNuevoJuego);
		add(ganaste);
		add(highscore);
	}
	
	private function menu()
	{
		FlxG.switchState(new MenuState());
	}
	
}