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
import flixel.input.keyboard.FlxKey;

/**
 * ...
 * @author Last Resort Games
 */
class LevelState extends FlxState
{
	
	public var BaseInn:Inn;
	
	
	override public function create():Void
	{
		super.create();
		BaseInn = new Inn(10, 10);
		
		
		
	}
	
	
	
	
	
	override public function update():Void 
	{
		super.update();
		
		
	}
	
	
	
}