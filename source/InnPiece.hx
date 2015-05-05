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

	public function new(X:Float,Y:Float, ?SimpleGraphic:Dynamic) 
	{
		super(x, y, SimpleGraphic);
		Pieces = new Map<Direction,Array<InnPiece>>();
	}
	
	public function AddNewPiece(dir:Direction, pieces:Array<InnPiece>)
	{
		Pieces.set(dir, pieces);
	}
	
}