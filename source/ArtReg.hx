package;

/**
 * ...
 * @author Last Resort Games
 */
class ArtReg
{
	public static var ArtMap:Map<String,Array<String>>;
	
	public static function GetSprite(key:String):String
	{
		return ArtMap[key][0];
	}
	
	public static function GetRandomSprite(key:String):String
	{
		var rand:Int = Std.int(Math.random() * ArtMap[key].length);
		return ArtMap[key][rand];
	}
	
	public static function GetSpriteByID(key:String, id:Int)
	{
		return ArtMap[key][id];
	}
	
	
}