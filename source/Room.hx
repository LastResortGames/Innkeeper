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
	public var Occupied:Bool;
	public var FloorNum:String;
	public var RoomNumber:String;
	

	public function new( ?SimpleGraphic:Dynamic) 
	{
		super(x, y, SimpleGraphic);
	}
	
	public function SetRoomStats(numbed:Int, craft:Bool, qual:Int, cost:Int )
	{
		NumBeds = numbed;
		CraftTable = craft;
		Quality = qual;
		CostToRun = cost;
		FloorNum = "1";
		Reg.AvailableRooms.push(this);
		RoomNumber = FloorNum + (Reg.AvailableRooms.length >= 10 ? "" : "0" ) + Reg.AvailableRooms.length;
		
	}
	
	public function SetCrafting(craft:Bool)
	{
		CraftTable = craft;
	}
	
}