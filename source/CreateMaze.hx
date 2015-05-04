package;


import flixel.util.FlxPoint;
import EnumReg;
/**
 * ...
 * @author Last Resort Games
 */
class CreateMaze
{
	
	public var mz:Array<Array<Node>>;
	public var Walls:Array<Array<Bool>>;
	
	//Prim Vars
	public var AllWalls:Array<FlxPoint>;
	public var PossibleWalls:Array<Wall>;
	public var Passages:Array<FlxPoint>;
	
	
	
	public var MazeHeight:Int;
	public var MazeWidth:Int;
	
	public var startingPos:FlxPoint;
	
	public var MazeExit:FlxPoint;

	public function new() 
	{
		MazeHeight = 20;
		MazeWidth = 30;
	}
	
	public function CreatePrimMaze(wid:Int = -1, ht:Int = -1 )
	{
		if (wid != -1)
		{
			trace(wid);
			MazeWidth = wid;
		}
		if (ht != -1)
		{
			MazeHeight = ht;
		}
		mz = new Array<Array<Node>>();
		Walls = new Array<Array<Bool>>();
		PossibleWalls = new Array<Wall>();
		for (i in 0...MazeWidth)
		{
			mz[i] = new Array<Node>();
			Walls[i] = new Array<Bool>();
			for( j in 0...MazeHeight)
			{
				mz[i][j] = null;
				Walls[i][j] = false;
			}
		}
		var startingCellX:Int = Std.int(Math.random() * (MazeWidth));
		var startingCellY:Int = Std.int(Math.random() * (MazeHeight));
		var endingX:Int = Std.int(Math.random() * (MazeWidth));
		var endingY:Int = Std.int(Math.random() * (MazeHeight));
		MazeExit = new FlxPoint(endingX, endingY);		
		startingPos = new FlxPoint(startingCellX, startingCellY);
		var startingNode:Node = new Node(startingPos);		
		AddSpotToMaze(startingNode);
		
		while (PossibleWalls.length > 0)
		{
			
			var randWall:Wall = PossibleWalls[Std.int(Math.random() * PossibleWalls.length)];
			randWall.MakeCellTwo();
			var neighbor:Node = randWall.CellTwo;
			
			if (mz[Std.int(neighbor.Loc.x)][Std.int(neighbor.Loc.y)] != null)
			{
				switch(randWall.Dir)
				{
					case NORTH:
						randWall.CellOne.FinalWalls[0] = new Wall(randWall.CellOne, NORTH);
						randWall.CellTwo.FinalWalls[1] = new Wall(randWall.CellTwo, SOUTH);
					case SOUTH:
						randWall.CellOne.FinalWalls[1] = new Wall(randWall.CellOne, SOUTH);
						randWall.CellTwo.FinalWalls[0] = new Wall(randWall.CellTwo, NORTH);
					case EAST:
						randWall.CellOne.FinalWalls[2] = new Wall(randWall.CellOne, EAST);
						randWall.CellTwo.FinalWalls[3] = new Wall(randWall.CellTwo, WEST);
					case WEST:
						randWall.CellOne.FinalWalls[3] = new Wall(randWall.CellOne, WEST);
						randWall.CellTwo.FinalWalls[2] = new Wall(randWall.CellTwo, EAST);
						case SOUTHEAST:
			case SOUTHWEST:
			case NORTHEAST:
			case NORTHWEST:
				}
				PossibleWalls.remove(randWall);
			}
			else
			{
				PossibleWalls.remove(randWall);
				//AddPassage(randWall);
				AddSpotToMaze(neighbor);
				
				
			}
		}
		//mz[Std.int(MazeExit.x)][Std.int(MazeExit.y)] = true;
	}
	
	public function RemoveWall(wall:Wall)
	{
		switch(wall.Dir)
		{
			case NORTH:
				Walls[Std.int(wall.CellTwo.Loc.x)][Std.int(wall.CellTwo.Loc.y-1)] = false;
			case SOUTH:
				Walls[Std.int(wall.CellTwo.Loc.x)][Std.int(wall.CellTwo.Loc.y+1)] = false;
			case EAST:
				Walls[Std.int(wall.CellTwo.Loc.x-1)][Std.int(wall.CellTwo.Loc.y)] = false;
			case WEST:
				Walls[Std.int(wall.CellTwo.Loc.x + 1)][Std.int(wall.CellTwo.Loc.y)] = false;
				case SOUTHEAST:
			case SOUTHWEST:
			case NORTHEAST:
			case NORTHWEST:
		}
	}
	
	public function AddWall(wall:Wall)
	{
		switch(wall.Dir)
		{
			case NORTH:
				Walls[Std.int(wall.CellTwo.Loc.x)][Std.int(wall.CellTwo.Loc.y-1)] = true;
			case SOUTH:
				Walls[Std.int(wall.CellTwo.Loc.x)][Std.int(wall.CellTwo.Loc.y+1)] = true;
			case EAST:
				Walls[Std.int(wall.CellTwo.Loc.x-1)][Std.int(wall.CellTwo.Loc.y)] = true;
			case WEST:
				Walls[Std.int(wall.CellTwo.Loc.x + 1)][Std.int(wall.CellTwo.Loc.y)] = true;
			case SOUTHEAST:
			case SOUTHWEST:
			case NORTHEAST:
			case NORTHWEST:
				
		}
	}
	
	
	public function AddSpotToMaze(node:Node)
	{
		mz[Std.int(node.Loc.x)][Std.int(node.Loc.y)] = node;
		node.CreateWalls(MazeWidth,MazeHeight);
		for (i in 0...4)
		{
			if (node.Walls[i] != null && !node.Walls[i].IsOutsideWall(MazeHeight,MazeWidth))
			{
				PossibleWalls.push(node.Walls[i]);
			}
		}
	}
	
	
}



