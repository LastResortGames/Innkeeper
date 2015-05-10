package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Last Resort Games
 */
class NineSpliceFlxSprite
{

	public var NineSliceGraphic:Array<FlxSprite>;
	
	public function new(imagePath:String, ext:String) 
	{
		NineSliceGraphic = new Array<FlxSprite>();
		for (i in 0...9)
		{
			var spr:FlxSprite;
			spr = new FlxSprite(100 + ((i % 3) * 32), 100 + (Std.int((i / 3)) * 32));
			spr.loadGraphic(imagePath + "_" + i + ext, false, 16, 16);
			spr.setGraphicSize(32, 32);
			NineSliceGraphic.push(spr);
			FlxG.state.add(spr);
		}
	}
	
	/**
	 *  Take in height and width and corners of inside Sprite
	 * @param	Width - Width of Whole Sprite
	 * @param	Height - Height of Whole Sprite
	 * @param	insideCorners - Corners of the inner slice in Top Left, Top Right, Bottom Right, Bottom Left order
	 */
	public function ResizeSlices(Width:Int, Height:Int, center:FlxPoint)
	{
		var innerWidth:Int = Width - 16;
		var innerHeight:Int = Height - 16;
		if (Width > 128)
		{
			innerWidth = Width - 128;
		}
		if (Height > 128)
		{
			innerHeight= Height - 128;
		}
		var outerWidth:Int = Std.int((Width - innerWidth) / 2);
		var outerHeight:Int = Std.int((Height - innerHeight) / 2);
		NineSliceGraphic[0].setGraphicSize(outerWidth, outerHeight);
		NineSliceGraphic[2].setGraphicSize(outerWidth, outerHeight);
		NineSliceGraphic[6].setGraphicSize(outerWidth, outerHeight);
		NineSliceGraphic[8].setGraphicSize(outerWidth, outerHeight);
		
		NineSliceGraphic[4].setGraphicSize(innerWidth, innerHeight);
		
		NineSliceGraphic[1].setGraphicSize(innerWidth, outerHeight);
		NineSliceGraphic[7].setGraphicSize(innerWidth, outerHeight);
		
		NineSliceGraphic[3].setGraphicSize(outerWidth, innerHeight);
		NineSliceGraphic[5].setGraphicSize(outerWidth, innerHeight);
		NineSliceGraphic[0].setPosition(center.x - (innerWidth/2) - (outerWidth/2), center.y - (innerHeight/2) - (outerHeight/2));
		NineSliceGraphic[1].setPosition(center.x, center.y - (innerHeight/2) - (outerHeight/2));
		NineSliceGraphic[2].setPosition(center.x + (innerWidth/2) + (outerWidth/2), center.y - (innerHeight/2) - (outerHeight/2));
		NineSliceGraphic[3].setPosition(center.x - (innerWidth/2) - (outerWidth/2), center.y);
		NineSliceGraphic[4].setPosition(center.x, center.y);
		NineSliceGraphic[5].setPosition(center.x + (innerWidth/2) + (outerWidth/2), center.y);
		NineSliceGraphic[6].setPosition(center.x- (innerWidth/2) - (outerWidth/2), center.y + (innerHeight/2) + (outerHeight/2));
		NineSliceGraphic[7].setPosition(center.x, center.y + (innerHeight/2) + (outerHeight/2));
		NineSliceGraphic[8].setPosition(center.x + (innerWidth/2) + (outerWidth/2), center.y + (innerHeight/2) + (outerHeight/2));
		
		
	}
	
}