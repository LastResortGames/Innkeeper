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
	
	public function GetDrop(level:Int)
	{
		var DropIDList:Array<String> = new Array<String>();
		for (i in 0...Drops.length)
		{
			
		}
	}
	
}