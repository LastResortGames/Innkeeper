package;

/**
 * ...
 * @author Last Resort Games
 */
class DropTable
{

	public var Drops:Array<DropRate>;
	
	public function new() 
	{
		Drops = new Array<DropRate>();
	}
	
	public function AddDrop(drop:DropRate)
	{
		Drops.push(drop);
	}
	
	public function GetAllDrops(level:Int):Array<String>
	{
		var DropIDList:Array<String> = new Array<String>();
		for (i in 0...Drops.length)
		{
			if (Drops[i].IsDropped(level))
			{
				DropIDList.push(Drops[i].DropID);
			}
		}
		return DropIDList;
	}
	
	public function GetOneDrop(level:Int):String
	{
		var DropIDList:Array<String> = new Array<String>();
		for (i in 0...Drops.length)
		{
			if (Drops[i].IsDropped(level))
			{
				DropIDList.push(Drops[i].DropID);
			}
		}
		var rand:Int = Std.int(Math.random() * DropIDList.length);
		return DropIDList[rand];
	}
	
}