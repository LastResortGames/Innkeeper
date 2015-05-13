package;

import flixel.FlxSprite;
import EnumReg;

/**
 * ...
 * @author Last Resort Games
 */
class InnPiece extends BaseSprite
{
	public var Pieces:Map<Direction,Array<InnPiece>>;
	public var assetScale:Float = .35; // scale for the lobby, hallways, and rooms
	public var doorOverlap:Int = 30; // constant that will get added to have doors overlap two inn pieces
	
	public function new(X:Float,Y:Float, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		Pieces = new Map<Direction,Array<InnPiece>>();
		scale.x = assetScale;
		scale.y = assetScale;
		updateHitbox();
		super.x = X;
		super.y = Y;
		doorOverlap = cast((doorOverlap * assetScale), Int);
	}
	
	public function AddHallway(dir:Direction, hallway:Hallway)
	{
		
		switch(dir)
		{
			case WEST:
				hallway.x = x - (hallway.frameWidth * assetScale) + doorOverlap;
				hallway.y = y + ((frameHeight * assetScale) / 2) - (hallway.frameHeight * assetScale) / 2;
			case EAST:
				hallway.x = x + (frameWidth * assetScale) - doorOverlap;
				hallway.y = y + ((frameHeight * assetScale) / 2) - (hallway.frameHeight * assetScale) / 2;
				hallway.angle = 180; // WARNING - rotating images hurts rendering performance, be wary
			case NORTH:
				
			case SOUTH:
				
			default:
				return;
		}
		
		
		
	}
	
	public function AddNewPiece(dir:Direction, pieces:Array<InnPiece>)
	{
		Pieces.set(dir, pieces);
	}
	
}