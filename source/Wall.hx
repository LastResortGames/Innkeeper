package;

import flixel.util.FlxPoint;
import EnumReg;
/**
 * ...
 * @author Last Resort Games
 */
class Wall
{
	public var CellOne:Node;
	public var CellTwo:Node;
	public var Dir:Direction;
	
	
	public function new(pt:Node,dir:Direction)
	{
		CellOne = pt;
		Dir = dir;
	}
	
	public function IsOutsideWall(ht:Int,wid:Int)
	{
		if (CellOne.Loc.x < 0 || CellOne.Loc.y < 0 || CellOne.Loc.x > wid || CellOne.Loc.y > ht)
		{
			return true;
		}		
		return false;
	}
	
	
	public function GetNorthCell()
	{
		CellTwo = new Node(new FlxPoint(CellOne.Loc.x, CellOne.Loc.y+1));
	}
	
	public function GetSouthCell()
	{
		CellTwo = new Node(new FlxPoint(CellOne.Loc.x, CellOne.Loc.y-1));
	}
	
	public function GetEastCell()
	{
		CellTwo = new Node(new FlxPoint(CellOne.Loc.x+1, CellOne.Loc.y));
	}
	
	public function GetWestCell()
	{
		CellTwo = new Node(new FlxPoint(CellOne.Loc.x-1, CellOne.Loc.y));
	}
	
	public function MakeCellTwo():Void 
	{
		switch(Dir)
		{
			case NORTH:
				GetNorthCell();
			case SOUTH:
				GetSouthCell();
			case EAST:
				GetEastCell();
			case WEST:
				GetWestCell();
				case SOUTHEAST:
			case SOUTHWEST:
			case NORTHEAST:
			case NORTHWEST:
		}
	}
}