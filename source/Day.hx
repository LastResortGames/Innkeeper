package;

import EnumReg;
import flixel.FlxG;

/**
 * ...
 * @author Last Resort Games
 */
class Day
{

	public var TimeOfDay:EnumValue;
	public var SlotState:EnumValue;
	public var EquipmentChance:DropTable;
	public var AvgLevels:Map<Int,Int>;
	public var GrpEquipment:Map<Int,EnumValue>;
	public var GrpQuest:Map<Int,EnumValue>;
	public var CheckedIn:Map<Int,Bool>;
	public var CameAndLeft:Map < Int, Bool>;
	public var NumInGroup:Map<Int,Int>;
	public var Heroes:Map<Int,Array<Hero>>;
	public var GroupTimer:Float;
	public var SlotTimer:Float;	
	public var CheckInTimer:Float;
	public var SlotMaxTimer:Float;
	public var GroupBeingChecked:Int;
	public var numGroups:Int;
	
	public var GroupCheckingIn:Bool;
	
	public var InnStats:InnStatCard;
	
	public var FinalPriceOffer:SelectionDialogue;
	
	
	public function new() 
	{
		SlotState = PRESLOT;
		GroupTimer = 0;
		SlotTimer = 0;
		//two minutes
		CheckInTimer = 5;
		//ten minutes
		SlotTimer = 600;
		AvgLevels = new Map<Int,Int>();
		GrpEquipment = new Map<Int,EnumValue>();
		GrpQuest = new Map<Int,EnumValue>();
		NumInGroup = new Map<Int,Int>();
		CheckedIn = new Map<Int,Bool>();
		CameAndLeft = new Map<Int,Bool>();
		Heroes = new Map<Int,Array<Hero>>();
		GroupBeingChecked = -1;
		GroupCheckingIn = false;
		InnStats = new InnStatCard(800, 600,500,300);
	}
	
	public function update()
	{
		if (SlotState == PRESLOT)
		{
			UpdateInnStats();
			var availableRooms:Int = Reg.AvailableRooms.length;
			var AvgQuality:Float = 0;
			for (i in 0...availableRooms)
			{
				AvgQuality += Reg.AvailableRooms[i].Quality;
			}
			AvgQuality = AvgQuality / availableRooms;
			
			numGroups = Std.int(Math.random() * Reg.AvailableRooms.length * 3);
			
			SetupEquipmentDropTable();
			var numHeroes:Int = 0;
			for (i in 0...numGroups)
			{
				var heroList:Array<Hero> = new Array<Hero>();
				var AvgLevel:Int = Std.int(Math.random() * (99 * (AvgQuality / 5)));
				AvgLevels.set(i,AvgLevel);
				GrpEquipment.set(i, ConvertToEquipment(EquipmentChance.GetOneDrop(AvgLevel)));
				GrpQuest.set(i, GetQuestProg(i));
				var numgrp:Int = Std.int(Math.random() * 4 + 1);
				numHeroes += numgrp;
				NumInGroup.set(i, numgrp);
				CheckedIn.set(i, false);
				CameAndLeft.set(i, false);
				
				for (j in 0...numgrp)
				{
					var hero:Hero = new Hero(i * 100,300 + (50 * j), "Girl", GetLevelInRange(AvgLevel), GrpEquipment.get(i), GrpQuest.get(i));
					hero.setGraphicSize(32, 32);
					hero.updateHitbox();
					heroList.push(hero);
					FlxG.state.add(hero);
				}
				Heroes.set(i, heroList);
			}
			
			SlotState = DURINGSLOT;
			
			
			
			//Generate All Heroes		
			//based on Time of Day
			//Put Heroes into a groups
			//average out levels and quest progress
			
			//Check heros out. 
			//Take money
			
			//Check Heros in. 
			
			//
		}
		else if (SlotState == DURINGSLOT)
		{
			GroupTimer += FlxG.elapsed;
			SlotTimer += FlxG.elapsed;
			if (GroupTimer >= CheckInTimer && !GroupCheckingIn)
			{
				GroupTimer = 0;
				if (GroupBeingChecked == -1)
				{
					PickGroup();
				}
				if (GroupBeingChecked == -1)
				{
					//end slot
				}
				else if(!GroupCheckingIn)
				{
					for (i in 0...Heroes.get(GroupBeingChecked).length)
					{
						Heroes.get(GroupBeingChecked)[i].ComeToDesk(700, 600 + (i*50));
					}
					GroupCheckingIn = true;
					InnStats.AddRooms();
			
				}	
			}
			
			if (GroupCheckingIn)
			{
				if (Reg.RoomChosen)
				{
					trace("roomchosen" + Reg.ChosenRoom);
					//Start price selection dialogue
					if (Reg.PriceChosen)
					{
						
					}
				}
				else
				{
					InnStats.update();
				}
			}
			
			if (SlotTimer > SlotMaxTimer)
			{
				//end slot
			}
			
			//Tick timer
			//Every "hour" a group of heroes comes to desk. 
			
			//if somebody is at desk they get in line. 
			//line will only get 2 long. 
			//slot will continue until all people in line are helped
			
			//heroes will randomly save 
			
		}
		else if (SlotState == POSTSLOT)
		{
			//Just in case?
		}		
	}
	
	public function UpdateInnStats()
	{
		
	}
	
	public function PickGroup()
	{
		var rand:Int = Std.int(Math.random() * numGroups);
		if (!CheckedIn.get(rand) && !CameAndLeft.get(rand))
		{
			GroupBeingChecked = rand;
		}
		else
		{
			var temp:Int = 1;
			while (rand - temp >= 0 || rand + temp < numGroups)
			{
				if (rand - temp >= 0)
				{
					if (!CheckedIn.get(rand- temp) && !CameAndLeft.get(rand- temp))
					{
						GroupBeingChecked = rand;
					}
				}
				else if(rand + temp < numGroups)
				{
					if (!CheckedIn.get(rand+ temp) && !CameAndLeft.get(rand+ temp))
					{
						GroupBeingChecked = rand;
					}
				}
				if (GroupBeingChecked == -1)
				{
					temp++;
				}
			}
			
		}
	}
	
	public function GetLevelInRange(lev:Int)
	{
		var rand:Int = Std.int(Math.random() * 10 - 5);
		return lev + rand;
	}
	
	public function GetQuestProg(gID:Int):EnumValue
	{
		var lev:Int = AvgLevels.get(gID);
		var eq:EnumValue = GrpEquipment.get(gID);
		if (lev < 20)
		{
			return BEGINNING;
		}
		else if ( lev >= 20 && lev < 37)
		{
			return MIDDLE;
		}
		else if (lev >= 37 && lev < 55)
		{
			return FINALSTRETCH;
		}
		else if (lev >= 55)
		{
			return GRINDING;
		}
		return GRINDING;
	}
	
	public function ConvertToEquipment(str:String):EnumValue
	{
		switch(str)
		{
			case "Poor":
				return POOR;
			case "Good":
				return GOOD;
			case "Great":
				return GREAT;
			case "Excellent":
				return EXCELLENT;
			case "Godly":
				return GODLY;				
		}
		return POOR;
	}
	
	function SetupEquipmentDropTable():Void 
	{
		var poorEquipDrop:DropRate = new DropRate();
		poorEquipDrop.MinLevel = 1;
		poorEquipDrop.MaxLevel = 30;
		poorEquipDrop.DropID = "Poor";
		poorEquipDrop.DropType = RANGE;
		poorEquipDrop.PercentData.push(100);
		poorEquipDrop.PercentData.push(20);			
		
		var goodEquipDrop:DropRate = new DropRate();
		goodEquipDrop.MinLevel = 10;
		goodEquipDrop.MaxLevel = 30;
		goodEquipDrop.DropID = "Good";
		goodEquipDrop.DropType = RANGE;
		goodEquipDrop.PercentData.push(80);
		goodEquipDrop.PercentData.push(40);
		
		var greatEquipDrop:DropRate = new DropRate();
		greatEquipDrop.MinLevel = 15;
		greatEquipDrop.MaxLevel = 50;
		greatEquipDrop.DropID = "Great";
		greatEquipDrop.DropType = RANGE;
		greatEquipDrop.PercentData.push(20);
		greatEquipDrop.PercentData.push(100);
		greatEquipDrop.PercentData.push(60);
		
		var excellentEquipDrop:DropRate = new DropRate();
		excellentEquipDrop.MinLevel = 40;
		excellentEquipDrop.MaxLevel = 80;
		excellentEquipDrop.DropID = "Excellent";
		excellentEquipDrop.DropType = RANGE;
		excellentEquipDrop.PercentData.push(60);
		excellentEquipDrop.PercentData.push(90);
		excellentEquipDrop.PercentData.push(100);
		
		var godlyEquipDrop:DropRate = new DropRate();
		godlyEquipDrop.MinLevel = 65;
		godlyEquipDrop.MaxLevel = 99;
		godlyEquipDrop.DropID = "Godly";
		godlyEquipDrop.DropType = RANGE;
		godlyEquipDrop.PercentData.push(35);
		godlyEquipDrop.PercentData.push(100);
		
		EquipmentChance = new DropTable();
		EquipmentChance.AddDrop(poorEquipDrop);
		EquipmentChance.AddDrop(goodEquipDrop);
		EquipmentChance.AddDrop(greatEquipDrop);
		EquipmentChance.AddDrop(excellentEquipDrop);
		EquipmentChance.AddDrop(godlyEquipDrop);
	}
	
}