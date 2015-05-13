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
	public var assetScale:Float = .5;
	
	public function new(X:Float,Y:Float, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		Pieces = new Map<Direction,Array<InnPiece>>();
		scale.x = assetScale;
		scale.y = assetScale;
		updateHitbox();
		super.x = X;
		super.y = Y;
	}
	
	public function AddNewPiece(dir:Direction, pieces:Array<InnPiece>)
	{
		Pieces.set(dir, pieces);
	}
	
}