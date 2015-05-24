package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxColor;
import openfl.display.DisplayObjectContainer;

/**
 * ...
 * @author Last Resort Games
 */
class NineSpliceFlxSprite
{

	public var NineSliceGraphic:Array<FlxSprite>;
	public var Width:Int;
	public var Height:Int;
	
	public function new(imagePath:String) 
	{
		NineSliceGraphic = new Array<FlxSprite>();
		for (i in 0...9)
		{
			var spr:FlxSprite;
			spr = new FlxSprite(100 + ((i % 3) * 32), 100 + (Std.int((i / 3)) * 32));
			spr.loadGraphic(ArtReg.GetSpriteByID(imagePath,i), false, 16, 16);
			spr.setGraphicSize(32, 32);
			spr.health = i;
			NineSliceGraphic.push(spr);
		}
		Width = 0;
		Height = 0;
		mouseReleased = true;
	}
	
	public function AddToStage(X:Int,Y:Int)
	{
		ResizeSlices(Width, Height, new FlxPoint(X, Y));
		for (i in 0...9)
		{
			FlxG.state.add(NineSliceGraphic[i]);
		}
	}
	
	/**
	 *  Take in height and width and corners of inside Sprite
	 * @param	Width - Width of Whole Sprite
	 * @param	Height - Height of Whole Sprite
	 * @param	insideCorners - Corners of the inner slice in Top Left, Top Right, Bottom Right, Bottom Left order
	 */
	public function ResizeSlices(width:Int, height:Int, center:FlxPoint)
	{
		var innerWidth:Int = width - 16;
		Width = width;
		var innerHeight:Int = height - 16;
		Height = height;
		Center = center;
		if (width > 64)
		{
			innerWidth = width - 64;
		}
		if (height > 64)
		{
			innerHeight = height - 64;
		}
		if (width > 128)
		{
			innerWidth = width - 128;
		}
		if (height > 128)
		{
			innerHeight= height - 128;
		}
		var outerWidth:Int = Std.int((width - innerWidth) / 2);
		var outerHeight:Int = Std.int((height - innerHeight) / 2);
		
		NineSliceGraphic[0].setGraphicSize(outerWidth, outerHeight);
		NineSliceGraphic[2].setGraphicSize(outerWidth, outerHeight);
		NineSliceGraphic[6].setGraphicSize(outerWidth, outerHeight);
		NineSliceGraphic[8].setGraphicSize(outerWidth, outerHeight);
		
		NineSliceGraphic[4].setGraphicSize(innerWidth, innerHeight);
		
		NineSliceGraphic[1].setGraphicSize(innerWidth, outerHeight);
		NineSliceGraphic[7].setGraphicSize(innerWidth, outerHeight);
		
		NineSliceGraphic[3].setGraphicSize(outerWidth, innerHeight);
		NineSliceGraphic[5].setGraphicSize(outerWidth, innerHeight);
		for (i in 0...9)
		{
			NineSliceGraphic[i].updateHitbox();
		}
		MoveSprite(center);
		//NineSliceGraphic[0].updateHitbox();
		
		
	}
	
	public function MoveSprite(center:FlxPoint)
	{
		var width:Int = Width;
		var height:Int = Height;
		var innerWidth:Int = width - 16;		
		var innerHeight:Int = height - 16;
		if (width > 64)
		{
			innerWidth = width - 64;
		}
		if (height > 64)
		{
			innerHeight = height - 64;
		}
		if (width > 128)
		{
			innerWidth = width - 128;
		}
		if (height > 128)
		{
			innerHeight= height - 128;
		}
		var outerWidth:Int = Std.int((width - innerWidth) / 2);
		var outerHeight:Int = Std.int((height - innerHeight) / 2);
		
		
		NineSliceGraphic[0].setPosition(center.x - (innerWidth / 2) - outerWidth, center.y - (innerHeight / 2) - outerHeight);	
		NineSliceGraphic[1].setPosition(center.x - (innerWidth/2), center.y - (innerHeight/2) - outerHeight);
		NineSliceGraphic[2].setPosition(center.x + (innerWidth/2), center.y - (innerHeight/2) - outerHeight);
		NineSliceGraphic[3].setPosition(center.x - (innerWidth / 2) - outerWidth, center.y- (innerHeight / 2));
		NineSliceGraphic[4].setPosition(center.x - (innerWidth/2), center.y- (innerHeight / 2));
		NineSliceGraphic[5].setPosition(center.x + (innerWidth/2), center.y- (innerHeight / 2));
		NineSliceGraphic[6].setPosition(center.x - (innerWidth / 2) - outerWidth, center.y + (innerHeight/2) );
		NineSliceGraphic[7].setPosition(center.x - (innerWidth/2), center.y + (innerHeight/2));
		NineSliceGraphic[8].setPosition(center.x + (innerWidth/2), center.y + (innerHeight / 2) );
		
	}
	
	public function AddClickAndDragMouseEvents()
	{
		
		for (i in 0...9)
		{
			MouseEventManager.add(NineSliceGraphic[i], GrabSprite, null, null, null, false, true, false);
		}
		
	}
	
	public function updateClickMovement()
	{
		if (FlxG.mouse.justReleased || !FlxG.mouse.pressed)
		{
			mouseReleased = true;
		}
		else if(MouseCenterDiff != null && !mouseReleased)
		{
			var newMouse:FlxPoint = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
			MoveSprite(new FlxPoint(MouseCenterDiff.x + newMouse.x, MouseCenterDiff.y + newMouse.y));
			Center = new FlxPoint(MouseCenterDiff.x + newMouse.x, MouseCenterDiff.y + newMouse.y);
		}
	}
	
	public var mousePosAtClick:FlxPoint;
	public var MouseCenterDiff:FlxPoint;
	public var mouseReleased:Bool;
	public var Center:FlxPoint;
	
	public var clickedID:Float;
	
	public function GrabSprite(obj:FlxSprite)
	{		
		if (mouseReleased)
		{
			clickedID = obj.health;
			mousePosAtClick = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
			MouseCenterDiff = new FlxPoint( Center.x - mousePosAtClick.x, Center.y - mousePosAtClick.y);
			mouseReleased = false;
		}
	}
		
}