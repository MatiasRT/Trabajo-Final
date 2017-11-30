package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
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
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		companyName = new FlxText (240, 20, 0, "A Matias Ruiz Torres Game", 10);
		var botonNuevoJuego = new FlxButton(x, 300, "New game", nuevo);
		var botonSalir = new FlxButton(x, 400, "Exit", salida);
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