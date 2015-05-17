package;

import EnumReg;

/**
 * ...
 * @author Last Resort Games
 */
class Hero extends BaseSprite
{

	public var inv:Inventory;
	
	public var convo:Conversation;
	
	public var QuestProgress:EnumValue;
	public var statCard:HeroStatCard;
	
	public function new(X:Float,Y:Float)
	{
		super(x, y, ArtReg.GetRandomSprite("hero"));
		inv = new Inventory();
		convo= new Conversation(250, 800, 500, 200);
		convo.AddDialog("This is a string of instantaneous text", -1);
		convo.AddDialog("This is a string of slow text", 100);
		convo.ContinueToNextDialogue();
		statCard = new HeroStatCard(200, 100, 256, 130);
		statCard.SetStats("Girl", "2", GOOD.getName(), GRINDING.getName());
		
	}
	
	
	public var clickset:Bool;
	override function update() 
	{
		super.update();
		if (!clickset)
		{
			statCard.AddClickAndDragMouseEvents();
			clickset = true;
			
		}
		convo.update();
		statCard.update();
	}
}