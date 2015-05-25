package;
import flixel.atlas.FlxAtlas.TempAtlasObj;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.FlxG;

/**
 * ...
 * @author Last Resort Games
 */
class Border
{
	public var RightSide:Array<FlxSprite>;
	public var LeftSide:Array<FlxSprite>;
	public var TopSide:Array<FlxSprite>;
	public var BottomSide:Array<FlxSprite>;
	public var Corners:Array<FlxSprite>;
	
	public var halfouter:Int;
	public var innerWid:Int;
	public var innerHt:Int;
	public var Width:Int;
	public var Height:Int;
	public var Center:FlxPoint;

	public function new(X:Float,Y:Float,width:Int, height:Int, borderkey:String)
	{
		Width = width;
		Height = height;		
		
		RightSide = new Array<FlxSprite>();
		LeftSide = new Array<FlxSprite>();
		TopSide= new Array<FlxSprite>();
		BottomSide = new Array<FlxSprite>();
		Corners = new Array<FlxSprite>();
	
		for (i in 0...4)
		{
			Corners.push(new FlxSprite());
			Corners[i].loadGraphic(ArtReg.GetSpriteByID(borderkey, i));
			switch(i)
			{
				case 0:
					Corners[i].setPosition(X + width / 2, Y - height / 2);
				case 1:
					Corners[i].setPosition(X + width / 2, Y + height / 2);
				case 2:
					Corners[i].setPosition(X - width / 2, Y + height / 2);
				case 3:
					Corners[i].setPosition(X - width / 2, Y - height / 2);
					
			}
			FlxG.state.add(Corners[i]);
			
		}
		for (i in 0...Std.int((Height - 10) / 10))
		{
			RightSide.push(new FlxSprite());
			RightSide[i].loadGraphic(ArtReg.GetSpriteByID(borderkey, 5));
			RightSide[i].setPosition(X + width / 2 + (52-33), Y - (height / 2) + (10 * (i +1 )));
			FlxG.state.add(RightSide[i]);
			
			LeftSide.push(new FlxSprite());
			LeftSide[i].loadGraphic(ArtReg.GetSpriteByID(borderkey, 5));
			LeftSide[i].setPosition(X - width / 2, Y - (height / 2) + (10 * (i + 1)));
			FlxG.state.add(LeftSide[i]);
			
		}
		for (i in 0...Std.int((Width - 10) / 10))
		{
			TopSide.push(new FlxSprite());
			TopSide[i].loadGraphic(ArtReg.GetSpriteByID(borderkey, 4));
			TopSide[i].setPosition(X - width / 2 + (10 * (i + 1)), Y - (height / 2));
			FlxG.state.add(TopSide[i]);
			
			BottomSide.push(new FlxSprite());
			BottomSide[i].loadGraphic(ArtReg.GetSpriteByID(borderkey, 4));
			BottomSide[i].setPosition(X - width / 2 + (10 * (i + 1)) , Y + (height / 2) + (52-33));
			FlxG.state.add(BottomSide[i]);
			
		}
		
	}
}