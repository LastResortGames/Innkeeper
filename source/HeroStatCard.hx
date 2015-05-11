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
		var halfouter:Int = 8;
		var innerWid:Int = Width - 16;
		var innerHt:Int = Height - 16;
		if (Width > 64)
		{
			innerWid = Width - 64;
			halfouter = 16;
		}
		if (Height > 64)
		{
			innerHt = Height - 64;
			halfouter = 16;
		}
		if (Width > 128)
		{
			innerWid = Width - 128;
			halfouter = 32;
		}
		if (Height > 128)
		{
			innerHt = Height - 128;
			halfouter = 32;
		}		
		TitleText = new FlxText(X - (innerWid/2) - halfouter, Y-(innerHt/2)- halfouter, Width / 2, "Name:\nLevel:\nEquipment:\nProgress:",14);
		FlxG.state.add(TitleText);
		
		StatText = new FlxText(X - (innerWid/2) - halfouter + Width / 2, Y-(innerHt/2)- halfouter, Width / 2, "Name:\nLevel:\nEquipment:\nProgress:",14);
		FlxG.state.add(StatText);
	}
	
	public function SetStats(name:String, lev:String, equipQual:String, prog:String)
	{
		StatText.text = name + "\n" + lev + "\n" + equipQual + "\n" + prog;
	}
	
	
}