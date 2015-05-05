package;
import flixel.FlxSprite;

/**
 * ...
 * @author Last Resort Games
 */
class BaseSprite extends FlxSprite
{
	
	public function new(X:Float,Y:Float, ?SimpleGraphic:Dynamic) 
	{
		super(x, y, SimpleGraphic);
	}
	
}