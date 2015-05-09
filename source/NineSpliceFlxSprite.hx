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
	public function ResizeSlices(Width:Int, Height:Int, insideCorners:Array<FlxPoint>)
	{
		var insideWidth:Int = Std.int(insideCorners[2].x - insideCorners[0].x);
		var insideHeight:Int = Std.int(insideCorners[2].y - insideCorners[0].y);
		trace(insideWidth);
		var outerWidth:Int = Std.int((Width - insideWidth) / 2);
		var outerHeight:Int = Std.int((Height - insideHeight) / 2);
		trace(outerWidth);
		NineSliceGraphic[0].setGraphicSize(outerWidth, outerHeight);
		NineSliceGraphic[2].setGraphicSize(outerWidth, outerHeight);
		NineSliceGraphic[6].setGraphicSize(outerWidth, outerHeight);
		NineSliceGraphic[8].setGraphicSize(outerWidth, outerHeight);
		
		NineSliceGraphic[4].setGraphicSize(insideWidth, insideHeight);
		
		NineSliceGraphic[1].setGraphicSize(insideWidth, outerHeight);
		NineSliceGraphic[7].setGraphicSize(insideWidth, outerHeight);
		
		NineSliceGraphic[3].setGraphicSize(outerWidth, insideHeight);
		NineSliceGraphic[5].setGraphicSize(outerWidth, insideHeight);
		//TODO The top corner is actually in the center of what I want. 
		NineSliceGraphic[0].setPosition(insideCorners[0].x - outerWidth, insideCorners[0].y - outerHeight);
		NineSliceGraphic[1].setPosition(insideCorners[0].x, insideCorners[0].y - outerHeight);
		NineSliceGraphic[2].setPosition(insideCorners[0].x + insideWidth, insideCorners[0].y - outerHeight);
		NineSliceGraphic[3].setPosition(insideCorners[0].x - outerWidth, insideCorners[0].y);
		NineSliceGraphic[4].setPosition(insideCorners[0].x, insideCorners[0].y);
		NineSliceGraphic[5].setPosition(insideCorners[0].x + insideWidth, insideCorners[0].y);
		NineSliceGraphic[6].setPosition(insideCorners[0].x - outerWidth, insideCorners[0].y + insideHeight);
		NineSliceGraphic[7].setPosition(insideCorners[0].x, insideCorners[0].y + insideHeight);
		NineSliceGraphic[8].setPosition(insideCorners[0].x + insideWidth, insideCorners[0].y + insideHeight);
		
		FlxG.state.add(new FlxSprite(insideCorners[0].x - outerWidth, insideCorners[0].y - outerHeight));
		
		
		
	}
	
}