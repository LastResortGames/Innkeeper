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
	
	// needs to be refactored if we want hallways to go N/S or rooms to go E/W
	public function AddInnPiece(dir:Direction, innPiece:InnPiece)
	{	
		switch(dir)
		{
			//hallway
			case WEST:
				innPiece.x = x - (innPiece.frameWidth * assetScale) + doorOverlap;
				innPiece.y = y + ((frameHeight * assetScale) / 2) - (innPiece.frameHeight * assetScale) / 2;
				
			//hallway
			case EAST:
				innPiece.angle = 180; // WARNING - rotating images hurts rendering performance, be wary
				innPiece.x = x + (frameWidth * assetScale) - doorOverlap;
				innPiece.y = y + ((frameHeight * assetScale) / 2) - (innPiece.frameHeight * assetScale) / 2;
			
			//room
			case NORTH:
				innPiece.x = x + ((frameWidth * assetScale) / 2) - (innPiece.frameWidth * assetScale) / 2;
				innPiece.y = y - (innPiece.frameHeight * assetScale) + doorOverlap;
			
			//room
			case SOUTH:
				innPiece.x = x + ((frameWidth * assetScale) / 2) - (innPiece.frameWidth * assetScale) / 2;
				innPiece.y = y + (frameHeight * assetScale) - doorOverlap;
				innPiece.angle = 180;
				
			default:
				return;
		}
		
	}
	
	public function AddNewPiece(dir:Direction, pieces:Array<InnPiece>)
	{
		Pieces.set(dir, pieces);
	}
	
}