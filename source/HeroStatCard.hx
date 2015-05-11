package;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Last Resort Games
 */
class HeroStatCard
{

	public var HeroName:String;
	public var HeroLevel:Int;
	public var EquipmentQuality:EnumValue;
	public var QuestProgress:EnumValue;
	public var bgSprite:NineSpliceFlxSprite;
	
	public var TitleText:FlxText;
	public var StatText:FlxText;
	
	
	public function new(X:Float, Y:Float, Width:Int, Height:Int) 
	{		
		bgSprite = new NineSpliceFlxSprite("assets/images/nineslice", ".png");
		bgSprite.ResizeSlices(Width, Height, new FlxPoint(X, Y));
		TitleText = new FlxText(X, Y, Width / 2, "Name:\nLevel:\nEquipment:\nProgress:");
		FlxG.state.add(TitleText);
	}
	
	
}