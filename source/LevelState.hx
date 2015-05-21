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
		
		innDesk = new FlxSprite(200, 200, ArtReg.GetSprite("desk"));//; AssetPaths.buttonDefault__png);
		innDesk.scale.x = .35;
		innDesk.scale.y = .35;
		add(innDesk);
		hero = new Hero(200, 180);
		//add(hero);
		
		var spr:FlxSprite = new FlxSprite(600, 40, ArtReg.GetSpriteByID("nineslice", 5));// AssetPaths.nineslice_2__png);
		add(spr);
		//var spr2:FlxSprite = new FlxSprite(600, 40, AssetPaths.nineslice_2__png);
		//add(spr2);
		
		spr.setSize(64, 64);
		spr.setGraphicSize(64, 64);
		spr.setGraphicSize(64, 64);
		spr.updateHitbox();
		MouseEventManager.add(spr, dostuff,null,null,null,false,true,false);
		//spr.updateHitbox();
		
		//MouseEventManager.add(spr2, dostuff2);
		
		var poorEquipDrop:DropRate = new DropRate();
			poorEquipDrop.MinLevel = 1;
			poorEquipDrop.MaxLevel = 30;
			poorEquipDrop.DropID = "Poor";
			poorEquipDrop.DropType = RANGE;
			poorEquipDrop.PercentData.push(10);
			poorEquipDrop.PercentData.push(100);
			poorEquipDrop.PercentData.push(40);
			
			for (i in 0...30)
			{
				poorEquipDrop.IsDropped(i);
			}
		
	}
	
	// using this to test inn piece placements
	private function generateStartingInn()
	{
		BaseInn = new Inn(600, 100, ArtReg.GetSprite("lobby"));
		
		var firstHallway = new Hallway();
		BaseInn.AddInnPiece(Direction.EAST, firstHallway);
		
		var secondHallway = new Hallway();
		firstHallway.AddInnPiece(Direction.EAST, secondHallway);
		
		var thirdHallway = new Hallway();
		BaseInn.AddInnPiece(Direction.WEST, thirdHallway);
		
		var firstRoom = new Room(ArtReg.GetSpriteByID("room", 4));
		firstRoom.SetRoomStats(4, false, 2, 50);
		secondHallway.AddInnPiece(Direction.NORTH, firstRoom);
		
		var secondRoom = new Room(ArtReg.GetSpriteByID("room", 3));
		secondRoom.SetRoomStats(4, true, 4, 200);
		firstHallway.AddInnPiece(Direction.SOUTH, secondRoom);
		
		add(BaseInn);
		add(firstHallway);
		add(secondRoom);
		
		add(secondHallway);
		add(firstRoom);
		
		add(thirdHallway);
		Reg.AvailableRooms.push(firstRoom);
		Reg.AvailableRooms.push(secondRoom);
		
		
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