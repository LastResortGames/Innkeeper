package ;

import flixel.*;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.input.gamepad.LogitechButtonID;
import flixel.text.FlxText;
import flixel.tile.FlxTileblock;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.util.FlxMath;
import EnumReg;
import flixel.ui.FlxButton;
import flixel.system.debug.Stats;
import flixel.input.keyboard.FlxKey;
import flixel.util.loaders.SparrowData;

/**
 * ...
 * @author Last Resort Games
 */
class LevelState extends FlxState
{
	
	
	public var LevelFinished:Bool;
	
	
	
	var BackToMainMenu:FlxButton;
	public var CurrState:EnumValue;
	public var MuteButton:FlxSprite;
	
	
	
	public var spd:Float;
	public var MULT:Float;
	
	public var moveTimer:Float;
	
	public var mz:Maze;
	public var nextPos:FlxPoint;
	
	/*** 
	 * 0= north
	 * 1 = south
	 * 2= east
	 * 3 = west	 
	 */
	public var Moving:Array<Bool>;
	
	var oldY:Int;
	var oldX:Int;
	
	public var titleScreenButt:FlxButton;
	public var ContinueButt:FlxButton;
	public var RestartButt:FlxButton;
	public var GOCam:FlxCamera;
	
	public var NumberOfMazes:FlxText;
	
	
	override public function create():Void
	{
		super.create();
		
		
		
		mz = new Maze(20,20);	
		mz.AddFloorToScene(this);
		mz.mazeCam.set_active(true);
		mz.mazeCam.set_visible(true);
		add(mz.mazeCam);
		
		
		
	}
	
	
	public function BackToMenu()
	{
		FlxG.switchState(new MainMenuState());
	}
	
	public function NextMazeSameTimer()
	{
		Reg.CurrentTimer = 10;
		FlxG.resetState();
	}
	
	public function NewMaze()
	{
		Reg.CurrentTimer = -1;
		FlxG.resetState();
	}
	
	
	
	override public function update():Void 
	{
		super.update();
		
			
			if (FlxG.keys.justPressed.R)
			{
				mz.mazeCam.zoom = .1;
			}
		
		
		
	}
	
	
	
}