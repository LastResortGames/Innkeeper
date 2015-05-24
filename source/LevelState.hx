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
	public var day:Day;
	
	override public function create():Void
	{
		super.create();

		generateStartingInn();
		innDesk = new FlxSprite(20, 700, ArtReg.GetSprite("desk"));
		innDesk.scale.x = .35;
		innDesk.scale.y = .35;
		innDesk.updateHitbox();
		add(innDesk);
		
		day = new Day();
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
		day.update();
	}
	
	
	
}