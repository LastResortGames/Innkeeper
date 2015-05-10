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
		convo= new Conversation(250, 800, 500, 200);
		convo.AddDialog("This is a string of instantaneous text", -1);
		convo.AddDialog("This is a string of slow text", 100);
		convo.ContinueToNextDialogue();
		
	}
	
	override function update() 
	{
		super.update();
		convo.update();
	}
}