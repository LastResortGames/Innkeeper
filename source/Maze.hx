package;

import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxPoint;
import flixel.FlxState;

/**
 * ...
 * @author Last Resort Games
 */
class Maze
{
	public var mz:Array<Array<Node>>;
	public var revealedMaze:Array<Array<Bool>>;
	public var Smoke:Array<Array<FlxSprite>>;
	public var crtMaze:CreateMaze;
	
	public var mazeCam:FlxCamera;
	public var mazeCamMarker:FlxSprite;
	
	public var startingPos:FlxPoint;
	public var currentPos:FlxPoint;

	public function new( wid:Int = -1, ht:Int = -1 ) 
	{
		crtMaze = new CreateMaze();
		Smoke = new Array<Array<FlxSprite>>();
		revealedMaze = new Array<Array<Bool>>();
		
		crtMaze.CreatePrimMaze(wid, ht);
		for (i in 0...crtMaze.MazeWidth)
		{
			Smoke[i] = new Array<FlxSprite>();
			revealedMaze[i] = new Array<Bool>();
			for( j in 0...crtMaze.MazeHeight)
			{
				Smoke[i][j] = null;
				revealedMaze[i][j] = false;
			}
		}
		mz = crtMaze.mz;
		startingPos = crtMaze.startingPos;
		currentPos = startingPos;
		var camWid:Int = 0;
		camWid = 30 * 32;
		var camHt:Int = 0;
		camHt = 20 * 20;
		if (wid != -1)
		{
			camWid = wid * 32;
		}
		if (ht != -1)
		{
			camHt = ht * 20;
		}
		mazeCam = new FlxCamera(0, 0, FlxG.width, FlxG.height);
		mazeCamMarker = new FlxSprite( -10000 + (startingPos.x * 32) +32, -10000   + (startingPos.y * 20) + 40);
		mazeCam.follow(mazeCamMarker);
		FlxG.cameras.add(mazeCam);
		
		mazeCam.bgColor = 0x0;
		revealedMaze[Std.int(startingPos.x)][Std.int(startingPos.y)] = true;
	}
	public function update()
	{
		
		
	}
	
	public function updateCurrPos(pt:FlxPoint)
	{
		currentPos = pt;
		revealedMaze[Std.int(pt.x)][Std.int(pt.y)] = true;
	}
	
	public function CanMoveNorth()
	{
		return mz[Std.int(currentPos.x)][Std.int(currentPos.y) - 1];		
	}
	public function CanMoveSouth()
	{
		return mz[Std.int(currentPos.x)][Std.int(currentPos.y) + 1];		
	}
	public function CanMoveEast()
	{
		return mz[Std.int(currentPos.x+1)][Std.int(currentPos.y)];		
	}
	public function CanMoveWest()
	{
		return mz[Std.int(currentPos.x)-1][Std.int(currentPos.y)];		
	}
	
	public function NorthIsRevealed()
	{
		return revealedMaze[Std.int(currentPos.x)][Std.int(currentPos.y) - 1];		
	}
	public function SouthIsRevealed()
	{
		return revealedMaze[Std.int(currentPos.x)][Std.int(currentPos.y) + 1];		
	}
	public function EastIsRevealed()
	{
		return revealedMaze[Std.int(currentPos.x+1)][Std.int(currentPos.y)];		
	}
	public function WestIsRevealed()
	{
		return revealedMaze[Std.int(currentPos.x)-1][Std.int(currentPos.y)];		
	}
	
	public function AddFloorToScene(st:FlxState):Void 
	{
		for (i in 0...mz.length)
		{
			for (j in 0...mz[0].length)
			{
				//if (i == startingPos.x && j == startingPos.y)
				//{
				//	var spr:FlxSprite = new FlxSprite( -10000 + (i * 32), -10000 + (j * 20), AssetPaths.element_red_square__png);
				//	
				//	spr.setGraphicSize(32, 32);
				//	st.add(spr);
				//}
				//else
				if (mz[i][j] != null)
				{
					var spr:FlxSprite = new FlxSprite(-10000 + (i * 32), -10000 + (j * 20), AssetPaths.castleWall__png);
					spr.setGraphicSize(32, 32);
					st.add(spr);
				}				
			}
		}
		
	}
	
	public function HideSmoke(pt:FlxPoint):Void 
	{
		for (i in 0...4)
		{
			for (j in 0...5)
			{
				if ((pt.x + i) % 2 == 0 && (pt.y + j) % 2 == 0)
				{
					if (pt.x + i-2 < mz.length && pt.x + i-2 >= 0 && pt.y + j-2 < mz[0].length && pt.y + j-2 >= 0)
					{
						Smoke[Std.int(pt.x + i - 2)][Std.int(pt.y + j - 2)].visible = false;
					}
				}
			}
		}
	}
	
	public function CheckExit():Bool
	{
		if (currentPos.x == crtMaze.MazeExit.x && currentPos.y == crtMaze.MazeExit.y)
		{
			return true;
		}
		return false;
	}
	
}