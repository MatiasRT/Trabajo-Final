package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import entities.Player;
import entities.Guide;

class PlayState extends FlxState
{
	private var player:Player;
	private var loader:FlxOgmoLoader;
	private var tileMap:FlxTilemap;
	private var guide:Guide;
	
	override public function create():Void
	{
		super.create();
		loader = new FlxOgmoLoader(AssetPaths.level__oel);
		tileMap = loader.loadTilemap(AssetPaths.prueba__png, 16, 16, "Tiles");
		bgColor = FlxColor.BLUE;
		loader.loadEntities(entityCreator, "Entities");
		guide = new Guide(FlxG.width / 2 , FlxG.height / 2);
		guide.velocity.y = Reg.velCamera;
		FlxG.camera.follow(guide);
		add(guide);
		
		add(tileMap);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		player.get_guide(guide);
	}
	
	private function entityCreator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		switch (entityName)
		{
			case "Player":
				player = new Player(guide);
				player.x = x;
				player.y = y;
				add(player);
		}
	}
}