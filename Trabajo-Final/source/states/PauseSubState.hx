package states;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class PauseSubState extends FlxSubState 
{
	public var closeButton:FlxButton;
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		FlxG.mouse.visible = true;
		var x:Int = Math.floor(FlxG.width / 2 - 40);
		closeButton = new FlxButton(x, 300, "Return to Game", returnToGame);
		
		var botonSalir = new FlxButton(x, 400, "Exit Game", salida);
		
		add(closeButton);
		add(botonSalir);
	}
	
	private function returnToGame()
	{
		close();
		FlxG.mouse.visible = false;
	}
	
	private function salida()
	{
		FlxG.switchState(new MenuState());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 class SubState extends FlxSubState
{
	// Some test sprite, showing that if the state is persistent (not destroyed after closing)
	// then it will save it's position (and all other properties)
	private var testSprite:FlxSprite;
	
	private var closeBtn:FlxButton;
	private var switchParentDrawingBtn:FlxButton;
	private var switchParentUpdatingBtn:FlxButton;
	
	// just a helper flag, showing if this substate is persistent or not
	public var isPersistent:Bool = false;
	
	override public function create():Void 
	{
		super.create();
		
		closeBtn = new FlxButton(FlxG.width * 0.5 - 40, FlxG.height * 0.5, "Close", onClick);
		add(closeBtn);
		
		switchParentDrawingBtn = new FlxButton(closeBtn.x, closeBtn.y + 40, "SwitchDraw", onSwitchDraw);
		add(switchParentDrawingBtn);
		
		switchParentUpdatingBtn = new FlxButton(switchParentDrawingBtn.x, switchParentDrawingBtn.y + 40, "SwitchUpdate", onSwitchUpdate);
		add(switchParentUpdatingBtn);
		
		testSprite = new FlxSprite(0, 10);
		testSprite.velocity.x = 20;
		add(testSprite);
	}
	
	private function onSwitchUpdate() 
	{
		if (_parentState != null)
		{
			// you can keep updating parent state if you want to, but keep in mind that
			// if you will update parent state then you will update buttons in it,
			// so you need to deactivate buttons in parent state
			_parentState.persistentUpdate = !_parentState.persistentUpdate;
		}
	}
	
	private function onSwitchDraw() 
	{
		if (_parentState != null)
		{
			// you can keep drawing parent state if you want to 
			// (for example, when substate have transparent background color)
			_parentState.persistentDraw = !_parentState.persistentDraw;
		}
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (testSprite.x > FlxG.width)
		{
			testSprite.x = -testSprite.width;
		}
	}
	
	private function onClick() 
	{
		// if you will pass 'true' (which is by default) into close() method then this substate will be destroyed
		// but when you'll pass 'false' then you should destroy it manually
		close();
	}
	
	// This function will be called by substate right after substate will be closed
	public static function onSubstateClose():Void
	{
		//FlxG.fade(FlxG.BLACK, 1, true);
	}
}
	*/

	
	
	
	
	
	
	
	
	
	
	/*
	 *class MenuState extends FlxState
{
	// Link to the persistent substate (which will exist after closing)
	private var persistentSubState:SubState;
	
	private var openpersistentBtn:FlxButton;
	private var openTempBtn:FlxButton;
	private var sprites:MySpriteGroup;
	
	private var subStateColor:FlxColor;
	
	override public function create():Void
	{
		FlxG.cameras.bgColor = FlxColor.WHITE;
		
		destroySubStates = false;
		
		// Some test group of sprites, used for showing substate system features
		sprites = new MySpriteGroup(50);
		add(sprites);
		
		subStateColor = 0x99808080;
		
		// We can create persistent substate and use it as many times as we want
		persistentSubState = new SubState(subStateColor);
		persistentSubState.isPersistent = true;
	
		openpersistentBtn = new FlxButton(20, 20, "OpenPersistent", onpersistentClick);
		add(openpersistentBtn);
		
		openTempBtn = new FlxButton(20, 60, "OpenTemp", onTempClick);
		add(openTempBtn);
	}
	
	private function onTempClick():Void
	{
		// This is temp substate, it will be destroyed after closing
		var tempState:SubState = new SubState(subStateColor);
		tempState.isPersistent = false;
		openSubState(tempState);
	}
	
	private function onpersistentClick():Void
	{
		openSubState(persistentSubState);
	}
	
	override public function destroy():Void
	{
		super.destroy();
		
		sprites = null;
		
		// don't forget to destroy persistent substate
		persistentSubState.destroy();
		persistentSubState = null;
	}

	override public function update(elapsed:Float):Void
	{
		// We need to deactivate these buttons if there is _substate and this state is keeps updating
		//openpersistentBtn.active = (_subState == null);
		//openTempBtn.active = (_subState == null);
		
		super.update(elapsed);
	}
}
*/
}
