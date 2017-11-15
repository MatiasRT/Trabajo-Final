package states;

import flixel.FlxState;
import entities.Player;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	private var player:Player;
	private var loader:FlxOgmoLoader;
	private var tileMap:FlxTilemap;
	
	override public function create():Void
	{
		super.create();
		loader = new FlxOgmoLoader(AssetPaths.level__oel);
		tileMap = loader.loadTilemap(AssetPaths.prueba__png, 16, 16, "Tiles");
		
		loader.loadEntities(entityCreator, "Entities");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function entityCreator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		
		switch (entityName)
		{
			case "Player":
				player = new Player();
				player.x = x;
				player.y = y;
				add(player);
		}
	}
}