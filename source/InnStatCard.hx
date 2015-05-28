package;

import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxPoint;
import flixel.FlxG;
import flixel.plugin.MouseEventManager;

/**
 * ...
 * @author Last Resort Games
 */
class InnStatCard
{
	
	public var RoomStats:Array<Array<FlxText>>;
	public var RoomOccupancy:Array<FlxButton>;
	public var StatTitles:Array<FlxText>;
	public var logSprite:NineSpliceFlxSprite;
	public var Width:Int;
	public var Height:Int;
	public var Center:FlxPoint;
	
	public var roomstatSpacing = 75;
	public var CardShown:Bool;

	public function new(X:Float, Y:Float, width:Int, height:Int) 
	{
		RoomStats = new Array<Array<FlxText>>();
		RoomOccupancy = new Array<FlxButton>();
		Width = width;
		Height = height;
		Center = new FlxPoint(X, Y);
		logSprite = new NineSpliceFlxSprite("nineslice");
		logSprite.ResizeSlices(width, height, Center);
		StatTitles = new Array<FlxText>();
		CardShown = false;
	}
	
	public function AddRooms()
	{
		var roomNumTitle:FlxText = new FlxText(Center.x - Width / 5 + 0 * roomstatSpacing, Center.y - Height / 2 + (20), Width ,      "Room #  |  ", 12);
		var roomQualTitle:FlxText = new FlxText(Center.x - Width / 5 + 1 * roomstatSpacing, Center.y - Height / 2 + (20), Width ,     "Quality  | ", 12);
		var roomBedsTitle:FlxText = new FlxText(Center.x - Width / 5 + 2 * roomstatSpacing, Center.y - Height / 2 + (20), Width ,     " # Beds  | ", 12);
		var roomCraftTitle:FlxText = new FlxText(Center.x - Width / 5 + 3 * roomstatSpacing, Center.y - Height / 2 + (20), Width ,    "Crafting | ", 12);
		var roomOccupiedTitle:FlxText = new FlxText(Center.x - Width / 5 + 4 * roomstatSpacing, Center.y - Height / 2 + (20), Width , " Occupied  ", 12);
		StatTitles.push(roomNumTitle);
		StatTitles.push(roomQualTitle);
		StatTitles.push(roomBedsTitle);
		StatTitles.push(roomCraftTitle);
		StatTitles.push(roomOccupiedTitle);
		
		for (i in 0...Reg.AvailableRooms.length)
		{
			var roomNumTxt:FlxText = new FlxText(Center.x - Width / 5 + 0 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			var roomQualTxt:FlxText = new FlxText(Center.x - Width / 5 + 1 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			var roomBedsTxt:FlxText = new FlxText(Center.x - Width / 5 + 2 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			var roomCraftTxt:FlxText = new FlxText(Center.x - Width / 5 + 3 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			var roomTemp = Reg.AvailableRooms[i];
			var roomOccupiedTxt:FlxText = null;
			var roomOccupiedButton:DataFlxButton = null;
			if (roomTemp.Occupied)
			{
				 roomOccupiedTxt= new FlxText(Center.x - Width / 5 + 4 * roomstatSpacing, Center.y - Height / 3 + (i * 30), Width , "", 12);
			}
			else
			{
				roomOccupiedButton = new DataFlxButton(Center.x - Width / 5 + 4 * roomstatSpacing, Center.y - Height / 3 + (i * 30), "Offer Room");
				roomOccupiedButton.DataID = i;
				roomOccupiedButton.onUp.callback = roomOccupiedButton.CheckHeroesIn;
			}
			roomNumTxt.text = AddSpaceToDetails(roomTemp.RoomNumber);
			roomQualTxt.text = AddSpaceToDetails(roomTemp.Quality + ""); 
			roomBedsTxt.text = AddSpaceToDetails(roomTemp.NumBeds + "");
			roomCraftTxt.text = AddSpaceToDetails((roomTemp.CraftTable ? "Yes" : "No"));
			if (roomOccupiedTxt != null)
			{
				roomOccupiedTxt.text = AddSpaceToDetails("Occupied");
			}
			
			RoomStats.push(new Array<FlxText>());
			RoomStats[i].push(roomNumTxt);
			RoomStats[i].push(roomQualTxt);
			RoomStats[i].push(roomBedsTxt);
			RoomStats[i].push(roomCraftTxt);
			if (roomOccupiedButton != null)
			{
				RoomOccupancy.push(roomOccupiedButton);
			}
			else
			{
				RoomStats[i].push(roomOccupiedTxt);
				RoomOccupancy.push(null);
			}	
		}
		//FlxG.state.add(StatTitles);
		
	}
	
	public function AddStatCardToScreen()
	{
		
		logSprite.AddToStage(Std.int(Center.x), Std.int(Center.y));
		for (i in 0...StatTitles.length)
		{
			FlxG.state.add(StatTitles[i]);
		}
		for (i in 0...Reg.AvailableRooms.length)
		{
			for (j in 0...RoomStats[i].length)
			{
				FlxG.state.add(RoomStats[i][j]);
				
			}
			if (RoomOccupancy[i] != null)
			{
				FlxG.state.add(RoomOccupancy[i]);
			}
		}
		logSprite.AddClickAndDragMouseEvents();
		CardShown = true;
	}
	
	public function RemoveStatCardFromScreen()
	{
		logSprite.RemoveFromStage();
		for (i in 0...StatTitles.length)
		{
			FlxG.state.remove(StatTitles[i]);
		}
		for (i in 0...Reg.AvailableRooms.length)
		{
			for (j in 0...RoomStats[i].length)
			{
				FlxG.state.remove(RoomStats[i][j]);
				
			}
			if (RoomOccupancy[i] != null)
			{
				FlxG.state.remove(RoomOccupancy[i]);
			}
		}
		logSprite.RemoveMouseEvents();
		CardShown = false;
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
		if (CardShown)
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
			for (i in 0...StatTitles.length)
			{
				StatTitles[i].setPosition(logSprite.Center.x - Width / 5 + i * roomstatSpacing, logSprite.Center.y - Height / 2 + (20));
			}
		}
	}
	
}