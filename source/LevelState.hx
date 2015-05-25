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
	
	public var baseInn:Inn;
	public var innDesk:FlxSprite;
	public var hero:Hero;
	public var dialogOne:DialogueBox;
	public var con:Conversation;
	public var day:Day;
	
	public var topBorder:Border;
	public var leftBorder:Border;
	public var rightBorder:Border;
	
	override public function create():Void
	{
		super.create();
		topBorder = new Border(800, 200, 1600, 375, "border");
		leftBorder = new Border(250, 650, 500, 475, "border");
		rightBorder = new Border(1050, 650, 1100, 475, "border");
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
		baseInn = new Inn(600, 100, ArtReg.GetSprite("lobby"));
		add(baseInn);
		
		addHallway(Direction.EAST, baseInn);
		addHallway(Direction.EAST, baseInn.pieces.get(Direction.EAST));
		addRoom(Direction.NORTH, baseInn.pieces.get(Direction.EAST), 4, false, 2, 50);
		
		var secondHallway = ((baseInn.pieces.get(Direction.EAST)).pieces).get(Direction.EAST);
		addRoom(Direction.SOUTH, secondHallway, 3, true, 4, 200);
	}
	
	public function addHallway(dir:Direction, parent:InnPiece)
	{
		var hallway = new Hallway();
		parent.addNewPiece(dir, hallway);
		add(hallway);
	}
	
	public function addRoom(dir:Direction, parent:InnPiece, numBeds:Int, craft:Bool, qual:Int, cost:Int)
	{
		var room = new Room(ArtReg.GetSpriteByID("room", numBeds));
		parent.addNewPiece(dir, room);
		
		// create the door
		var door = createDoor(dir, room);
		
		// set the room stats and we're in business!
		room.SetRoomStats(numBeds, craft, qual, cost);
		
		// add the new pieces
		add(room);
		add(door);		
	}
	
	private function createDoor(dir:Direction, room:InnPiece):FlxSprite
	{
		var door = new FlxSprite(0, 0, ArtReg.GetSprite("door"));
		door.scale.x = room.assetScale;
		door.scale.y = room.assetScale;
		door.updateHitbox();
		
		switch(dir)
		{
			case NORTH:
				door.x = room.x + ((room.frameWidth * room.assetScale) / 2) - (door.frameWidth * room.assetScale) / 2;
				door.y = room.y + (room.frameHeight * room.assetScale) - (door.frameHeight * room.assetScale) / 2;
			
			case SOUTH:
				door.x = room.x + ((room.frameWidth * room.assetScale) / 2) - (door.frameWidth * room.assetScale) / 2;
				door.y = room.y - (door.frameHeight * room.assetScale) / 2;
				
			default:
				return door;
		}
		
		return door;
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