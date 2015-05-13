package;


/**
 * ...
 * @author Last Resort Games
 */
class Room extends InnPiece
{
	
	public var NumBeds:Int;
	public var CraftTable:Bool;
	public var Quality:Int;
	public var CostToRun:Int;

	public function new(X:Float,Y:Float, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
	}
	
	public function SetRoomStats(numbed:Int, craft:Bool, qual:Int, cost:Int )
	{
		NumBeds = numbed;
		CraftTable = craft;
		Quality = qual;
		CostToRun = cost;
	}
	
	public function SetCrafting(craft:Bool)
	{
		CraftTable = craft;
	}
	
}