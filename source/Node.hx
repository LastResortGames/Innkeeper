package;

import flixel.util.FlxPoint;
import EnumReg;
/**
 * ...
 * @author Last Resort Games
 */
class Node
{
	public var Loc:FlxPoint;
	public var Walls:Array<Wall>;
	public var FinalWalls:Array<Wall>;
	
	public function new(pt:FlxPoint)
	{
		Loc = pt;	
		FinalWalls = new Array<Wall>();
		FinalWalls.push(null);
		FinalWalls.push(null);
		FinalWalls.push(null);
		FinalWalls.push(null);
		
	}
	
	public function CreateWalls(wid:Int, ht:Int):Void 
	{
		Walls = new Array<Wall>();
		for (i in 0...4)
		{
			var dir:EnumValue = NORTH;
			switch(i)
			{
				case 0:
					if (Loc.y >= 1)
					{
						Walls.push(new Wall(this,NORTH));
					}
				case 1:
					if (Loc.y < ht-1)
					{
						Walls.push(new Wall(this, SOUTH));
					}
				case 2:
					trace(wid);
					if (Loc.x < wid-1)
					{
						Walls.push(new Wall(this, EAST));
					}
				case 3:
					if (Loc.x >= 1)
					{
						Walls.push(new Wall(this, WEST));		
					}
			}						
		}
	}
}