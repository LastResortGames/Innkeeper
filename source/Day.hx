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