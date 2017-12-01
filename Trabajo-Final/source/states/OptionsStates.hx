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
class OptionsStates extends FlxState 
{

	override public function create()
	{
		FlxG.mouse.visible = true;
		bgColor = FlxColor.BLACK;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		var controles = new FlxText (35, 20, 0, "Controls:", 28); 
		var text1 = new FlxText(35, 80, 0,"Arrows to Move the X-Wing", 10);
		var text2 = new FlxText(35, 100, 0, "Spacebar to Shoot", 10);
		var text3 = new FlxText(35, 120, 0, "Z to Activate Power-Ups (One PU: Double the speed, Two PU: Triple Shoot)", 10);
		var text4 = new FlxText(35, 140, 0, "P is for Pause", 10);
		var botonSalir = new FlxButton(x, 400, "Back to Menu", salida);
		add(text1);
		add(text2);
		add(text3);
		add(text4);
		add(botonSalir);
		add(controles);
	}
	
	private function salida()
	{
		FlxG.switchState(new MenuState());
	}
	
}