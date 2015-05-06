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
	public var innDesk:FlxSprite;
	public var hero:Hero;
	public var dialogOne:DialogueBox;
	
	override public function create():Void
	{
		super.create();
		BaseInn = new Inn(10, 10);
		innDesk = new FlxSprite(200, 200, AssetPaths.buttonDefault__png);
		add(innDesk);
		hero = new Hero(200, 180, AssetPaths.eightbitwoman__png);
		add(hero);
		dialogOne = new DialogueBox(0, 0);
		dialogOne.SetText("Hello World!", 300);
	}
	
	
	
	
	
	override public function update():Void 
	{
		super.update();
		
		dialogOne.update();
	}
	
	
	
}