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