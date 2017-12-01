package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level.oel", "assets/data/level.oel");
			type.set ("assets/data/level.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Level.oep", "assets/data/Level.oep");
			type.set ("assets/data/Level.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Death_Star.png", "assets/images/Death_Star.png");
			type.set ("assets/images/Death_Star.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy1.png", "assets/images/Enemy1.png");
			type.set ("assets/images/Enemy1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy2.png", "assets/images/Enemy2.png");
			type.set ("assets/images/Enemy2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Enemy3.png", "assets/images/Enemy3.png");
			type.set ("assets/images/Enemy3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Fondo.png", "assets/images/Fondo.png");
			type.set ("assets/images/Fondo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Galaxy.jpg", "assets/images/Galaxy.jpg");
			type.set ("assets/images/Galaxy.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Jedi.jpg", "assets/images/Jedi.jpg");
			type.set ("assets/images/Jedi.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Jedi.png", "assets/images/Jedi.png");
			type.set ("assets/images/Jedi.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Powerup.png", "assets/images/Powerup.png");
			type.set ("assets/images/Powerup.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/prueba.png", "assets/images/prueba.png");
			type.set ("assets/images/prueba.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Sith.png", "assets/images/Sith.png");
			type.set ("assets/images/Sith.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/star-wars-logo.jpg", "assets/images/star-wars-logo.jpg");
			type.set ("assets/images/star-wars-logo.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Tiles-TP-Final.png", "assets/images/Tiles-TP-Final.png");
			type.set ("assets/images/Tiles-TP-Final.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Xwing.png", "assets/images/Xwing.png");
			type.set ("assets/images/Xwing.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/music/Star-wars-lose.ogg", "assets/music/Star-wars-lose.ogg");
			type.set ("assets/music/Star-wars-lose.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/Star-wars-menu.ogg", "assets/music/Star-wars-menu.ogg");
			type.set ("assets/music/Star-wars-menu.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/Star-wars-playstate.ogg", "assets/music/Star-wars-playstate.ogg");
			type.set ("assets/music/Star-wars-playstate.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/Star-wars-win.ogg", "assets/music/Star-wars-win.ogg");
			type.set ("assets/music/Star-wars-win.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
