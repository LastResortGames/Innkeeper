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
	
	public function new(X:Float,Y:Float, name:String, lev:Int,eq:EnumValue,quest:EnumValue)
	{
		super(X,Y, ArtReg.GetRandomSprite("hero"));
		inv = new Inventory();
		convo= new Conversation(250, 800, 500, 200);
		convo.AddDialog("This is a string of instantaneous text", -1);
		convo.AddDialog("This is a string of slow text", 100);
		statCard = new HeroStatCard(700, 600, 256, 130);
		statCard.SetStats(name, lev +"", eq.getName(), quest.getName());
		
	}
	public function ComeToDesk(X:Int,Y:Int)
	{
		statCard.AddToStage(X,Y);
		statCard.AddClickAndDragMouseEvents();
	}
	
	public function FinishCheckIn()
	{
		statCard.RemoveFromStage();
		statCard.RemoveMouseEvents();
	}
	
	
	public var clickset:Bool;
	override function update() 
	{
		super.update();
		if (!clickset)
		{
			
			clickset = true;
			
		}
		convo.update();
		statCard.update();
	}
}