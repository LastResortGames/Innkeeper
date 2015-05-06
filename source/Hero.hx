package;

/**
 * ...
 * @author Last Resort Games
 */
class Hero extends BaseSprite
{

	public var inv:Inventory;
	
	public var convo:Conversation;
	
	public function new(X:Float,Y:Float, ?SimpleGraphic:Dynamic) 
	{
		super(x, y, SimpleGraphic);
		inv = new Inventory();
		
	}
	
}