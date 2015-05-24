package;

import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxPoint;
import flixel.FlxG;

/**
 * ...
 * @author Last Resort Games
 */
class InnStatCard
{
	
	public var RoomStats:Array<Array<FlxText>>;
	public var RoomOccupancy:Array<FlxButton>;
	public var StatTitles:FlxText;
	public var logSprite:NineSpliceFlxSprite;
	public var Width:Int;
	public var Height:Int;
	public var Center:FlxPoint;
	
	public var roomstatSpacing = 65;

	public function new(X:Float, Y:Float, width:Int, height:Int) 
	{
		RoomStats = new Array<Array<FlxText>>();
		RoomOccupancy = new Array<FlxButton>();
		Width = width;
		Height = height;
		Center = new FlxPoint(X, Y);
		logSprite = new NineSpliceFlxSprite("nineslice");
		logSprite.ResizeSlices(width, height, Center);
		StatTitles = new FlxText(Center.x - Width / 5, Center.y - Height / 2 + (20), Width, "", 12);
		StatTitles.text = "Room # | Quality | # Beds | Crafting | Occupied";
	}
	
	public function AddRooms()
	{
		logSprite.AddToStage(Std.int(Center.x), Std.int(Center.y));
		for (i in 0...Reg.AvailableRooms.length)
		{
			var roomNumTxt:FlxText = new FlxText(Center.x - Width / 5 + 0 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			var roomQualTxt:FlxText = new FlxText(Center.x - Width / 5 + 1 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			var roomBedsTxt:FlxText = new FlxText(Center.x - Width / 5 + 2 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			var roomCraftTxt:FlxText = new FlxText(Center.x - Width / 5 + 3 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			var roomTemp = Reg.AvailableRooms[i];
			var roomOccupiedTxt:FlxText = null;
			var roomOccupiedButton:FlxButton = null;
			if (roomTemp.Occupied)
			{
				 roomOccupiedTxt= new FlxText(Center.x - Width / 5 + 4 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			}
			else
			{
				roomOccupiedButton = new FlxButton(Center.x - Width / 5 + 4 * roomstatSpacing, Center.y - Height / 3 + (i * 30), "Offer Room",CheckInHeroes);
			}
			roomNumTxt.text = AddSpaceToDetails(roomTemp.RoomNumber);
			roomQualTxt.text = AddSpaceToDetails(roomTemp.Quality + ""); 
			roomBedsTxt.text = AddSpaceToDetails(roomTemp.NumBeds + "");
			roomCraftTxt.text = AddSpaceToDetails((roomTemp.CraftTable ? "Yes" : "No"));
			if (roomOccupiedTxt != null)
			{
				roomOccupiedTxt.text = AddSpaceToDetails("Occupied");
			}
			
			FlxG.state.add(roomNumTxt);
			FlxG.state.add(roomQualTxt);
			FlxG.state.add(roomBedsTxt);
			FlxG.state.add(roomCraftTxt);
			
			RoomStats.push(new Array<FlxText>());
			RoomStats[i].push(roomNumTxt);
			RoomStats[i].push(roomQualTxt);
			RoomStats[i].push(roomBedsTxt);
			RoomStats[i].push(roomCraftTxt);
			if (roomOccupiedButton != null)
			{
				RoomOccupancy.push(roomOccupiedButton);
				FlxG.state.add(roomOccupiedButton);
			}
			else
			{
				RoomStats[i].push(roomOccupiedTxt);
				FlxG.state.add(roomOccupiedTxt);
				RoomOccupancy.push(null);
			}	
		}
		FlxG.state.add(StatTitles);
		logSprite.AddClickAndDragMouseEvents();
	}
	
	public function CheckInHeroes()
	{
		var roomid:Int = RoomOccupancy.lastIndexOf();
		trace(roomid);
	}
	
	public function AddSpaceToDetails(str:String)
	{
		var spaces:String = "";
		for (i in 0...11 - str.length )
		{
			spaces += " ";
		}
		return str + spaces;
	}
	
	public function update()
	{
		logSprite.updateClickMovement();
		for (i in 0...RoomStats.length)
		{
			for (j in 0...RoomStats[i].length)
			{			
				RoomStats[i][j].setPosition(logSprite.Center.x - Width / 5 + j * roomstatSpacing, logSprite.Center.y - Height / 3 + (i * 30));			
			}
			if (RoomOccupancy[i] != null)
			{
				RoomOccupancy[i].setPosition(logSprite.Center.x - Width / 5 + 4 * roomstatSpacing, logSprite.Center.y - Height / 3 + (i * 30));
			}
		}
		StatTitles.setPosition(logSprite.Center.x - Width / 5, logSprite.Center.y - Height / 2 + (20));
	}
	
}