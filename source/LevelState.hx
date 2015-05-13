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
import flixel.plugin.MouseEventManager;

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
	public var con:Conversation;
	
	
	override public function create():Void
	{
		super.create();

		generateStartingInn();
		
		innDesk = new FlxSprite(200, 200, AssetPaths.buttonDefault__png);
		add(innDesk);
		hero = new Hero(200, 180, AssetPaths.eightbitwoman__png);
		//add(hero);
		
		var spr:FlxSprite = new FlxSprite(600, 40, AssetPaths.nineslice_2__png);
		add(spr);
		//var spr2:FlxSprite = new FlxSprite(600, 40, AssetPaths.nineslice_2__png);
		//add(spr2);
		
		spr.setSize(64, 64);
		spr.setGraphicSize(64, 64);
		spr.updateHitbox();
		MouseEventManager.add(spr, dostuff,null,null,null,false,true,false);
		//spr.updateHitbox();
		
		//MouseEventManager.add(spr2, dostuff2);
	}
	
	private function generateStartingInn()
	{
		BaseInn = new Inn(600, 50, AssetPaths.baseLobby__png);
		
		var firstHallway = new Hallway(AssetPaths.hallway__png);
		BaseInn.AddHallway(Direction.EAST, firstHallway);
		
		var secondHallway = new Hallway(AssetPaths.hallway__png);
		firstHallway.AddHallway(Direction.EAST, secondHallway);
		
		var thirdHallway = new Hallway(AssetPaths.hallway__png);
		BaseInn.AddHallway(Direction.WEST, thirdHallway);
		
		add(BaseInn);
		add(firstHallway);
		add(secondHallway);
		add(thirdHallway);
		
	}
	
	public function dostuff(spr:FlxSprite)
	{
		trace("clickhere");
	}
	
	public function dostuff2(spr:FlxSprite)
	{
		trace("clickhere2");
	}
	
	
	
	
	override public function update():Void 
	{
		super.update();
		hero.update();
	}
	
	
	
}