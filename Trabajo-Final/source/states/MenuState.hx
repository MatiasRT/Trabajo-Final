package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import openfl.Lib;

/**
 * ...
 * @author ...
 */
class MenuState extends FlxState 
{

	private var companyName:FlxText;
	
	override public function create() 
	{
		FlxG.mouse.visible = true;
		bgColor = FlxColor.BLACK;
		var starwars = new FlxSprite(2, 20, AssetPaths.star_wars_logo__jpg);
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		companyName = new FlxText (220, 30, 0, "A Matias Ruiz Torres Game", 12);
		var botonNuevoJuego = new FlxButton(x, 400, "New game", nuevo);
		var botonSalir = new FlxButton(x, 500, "Exit", salida);
		add(starwars);
		add(botonNuevoJuego);
		add(botonSalir);
		add(companyName);
		
	}
	
	private function nuevo()
	{
		FlxG.switchState(new PlayState());
	}
	
	private function salida()
	{
		Lib.close();
	}
	
}