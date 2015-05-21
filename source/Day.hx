package;

import EnumReg;

/**
 * ...
 * @author Last Resort Games
 */
class Day
{

	public var TimeOfDay:EnumValue;
	public var SlotState:EnumValue;
	
	public function new() 
	{
		
	}
	
	public var SlotTimer:Float;
	
	public function update()
	{
		if (SlotState == PRESLOT)
		{
			var availableRooms:Int = Reg.AvailableRooms.length;
			var AvgQuality:Float = 0;
			for (i in 0...availableRooms)
			{
				AvgQuality += Reg.AvailableRooms[i].Quality;
			}
			AvgQuality = AvgQuality / availableRooms;
			
			var numGroups:Int = Std.int(Math.random() * Reg.AvailableRooms.length * 3);
			var AvgLevels:Array<Int> = new Array<Int>();
			for (i in 0...numGroups)
			{
				var AvgLevel:Int = Std.int(Math.random() * (99 * (AvgQuality / 5));
				AvgLevels.push(AvgLevel);
			}
			
			var GroupEquipment:Array<EnumValue> = new Array<EnumValue>();
			
			var poorEquipDrop:DropRate = new DropRate();
			poorEquipDrop.MinLevel = 1;
			poorEquipDrop.MaxLevel = 30;
			poorEquipDrop.DropID = "Poor";
			poorEquipDrop.DropType = RANGE;
			poorEquipDrop.PercentData.push(100);
			poorEquipDrop.PercentData.push(20);
			
			poorEquipDrop.IsDropped(27);
			
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
			
			var dropT:DropTable = new DropTable();
			dropT.AddDrop(poorEquipDrop);
			dropT.AddDrop(goodEquipDrop);
			dropT.AddDrop(greatEquipDrop);
			dropT.AddDrop(excellentEquipDrop);
			dropT.AddDrop(godlyEquipDrop);
			
			dropT.GetDrop(27);
			
			
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
	
}