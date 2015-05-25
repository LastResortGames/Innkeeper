package;
import flixel.effects.FlxSpriteFilter;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
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
	
	public var Center:FlxPoint;
	
	public var halfouter:Int;
	public var innerWid:Int;
	public var innerHt:Int;
	public var Width:Int;
	public var Height:Int;
	
	public function new(X:Float, Y:Float, width:Int, height:Int)
	{		
		bgSprite = new NineSpliceFlxSprite("nineslice");
		bgSprite.ResizeSlices(width, height, new FlxPoint(X, Y));
		Width = width;
		Height = height;
		halfouter = 8;
		innerWid = width - 16;
		innerHt = height - 16;
		if (width > 64)
		{
			innerWid = width - 64;
			halfouter = 16;
		}
		if (height > 64)
		{
			innerHt = height - 64;
			halfouter = 16;
		}
		if (width > 128)
		{
			innerWid = width - 128;
			halfouter = 32;
		}
		if (height > 128)
		{
			innerHt = height - 128;
			halfouter = 32;
		}		
		TitleText = new FlxText(X - (innerWid/2) - halfouter, Y-(innerHt/2)- halfouter, width / 2, "Name:\nLevel:\nEquipment:\nProgress:",14);
		
		
		StatText = new FlxText(X - (innerWid/2) - halfouter + width / 2, Y-(innerHt/2)- halfouter, width / 2, "Name:\nLevel:\nEquipment:\nProgress:",14);
		
	}
	
	public function AddToStage(X:Int,Y:Int)
	{
		TitleText.x = X - (innerWid / 2) - halfouter;
		TitleText.y = Y - (innerHt / 2) - halfouter;
		StatText.x = X - (innerWid / 2) - halfouter + Width / 2;
		StatText.y = Y - (innerHt / 2) - halfouter;
		bgSprite.AddToStage(X,Y);
		FlxG.state.add(TitleText);
		FlxG.state.add(StatText);
		
	}
	
	public function AddClickAndDragMouseEvents()
	{
		bgSprite.AddClickAndDragMouseEvents();	
	}
	
	public function update()
	{
		bgSprite.updateClickMovement();
		TitleText.setPosition(bgSprite.Center.x - (innerWid/2) - halfouter, bgSprite.Center.y -(innerHt/2)- halfouter);
		StatText.setPosition(bgSprite.Center.x - (innerWid / 2) - halfouter + Width / 2, bgSprite.Center.y -(innerHt / 2) - halfouter);
	}
	
	
	public function SetStats(name:String, lev:String, equipQual:String, prog:String)
	{
		StatText.text = name + "\n" + lev + "\n" + equipQual + "\n" + prog;
	}
	
	
}