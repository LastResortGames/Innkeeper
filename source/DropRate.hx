package;

import EnumReg;
import flixel.util.FlxMath;

/**
 * ...
 * @author Last Resort Games
 */
class DropRate
{
	
	/**
	 * Whether the item is dropped linearly, at steps, or only one way. 
	 */
	public var DropType:EnumValue;
	
	/**
	 * The steps they can be dropped at. 
	 * If a range there are two values. The percent drop is lineasrly related to the input.
	 * If staggered. There is a value for every step and if the step is surpassed the drop is that percent
	 * If Flat the percent is always the same. 
	 */
	public var PercentData:Array<Int>;
	/**
	 * If staggered, these are the steps.
	 */
	public var InputRange:Array<Int>;
	
	public var MinLevel:Int;
	public var MaxLevel:Int;
	
	/**
	 * The ID of the thing to be dropped. Will likely need to be converted in some way.
	 */
	public var DropID:String;

	public function new() 
	{
		InputRange = new Array<Int>();
		PercentData = new Array<Int>();
		MinLevel = 1;
		MaxLevel = 99;
	}
	
	public function IsDropped(level:Int)
	{
		if ((level >= MinLevel || MinLevel == -1)  && (level <= MaxLevel || MaxLevel == -1))
		{
			switch(DropType)
			{
				case RANGE:
					if (PercentData.length >= 2)
					{
						//Make level range from 0 to max-min.
						var maxToZero:Int = MaxLevel - MinLevel;
						var rangeBetweenPercents:Float = maxToZero / (PercentData.length - 1);
						
						var percIndex:Int = 0;
						var tempMinPerc:Float = MinLevel;
						var tempMaxPerc:Float = MinLevel + rangeBetweenPercents;
						while (level > tempMinPerc && level > tempMaxPerc)
						{
							percIndex++;
							tempMinPerc += rangeBetweenPercents;
							tempMaxPerc += rangeBetweenPercents;
						}
						var compPerc:Float;
						if (PercentData[percIndex] > PercentData[percIndex + 1])
						{
							compPerc = FlxMath.lerp(PercentData[percIndex + 1],PercentData[percIndex], 1 - ((level - tempMinPerc) / (rangeBetweenPercents)));
						}
						else
						{
							compPerc = FlxMath.lerp(PercentData[percIndex],PercentData[percIndex + 1], (level - tempMinPerc) / (rangeBetweenPercents));
						}
						
						var rand:Float = Math.random() * 100;
						if (rand < compPerc)
						{
							return true;
						}
					}
					
					
				case STAGGERED:
					var percIndex:Int = 0;
					var tempMinPerc:Float = PercentData[percIndex];
					while (level < tempMinPerc)
					{
						percIndex++;
						tempMinPerc = InputRange[percIndex];
					}
					var rand:Float = Math.random() * 100;
					if (rand < PercentData[percIndex])
					{
						return true;
					}
					return false;
					
					
				case FLAT:
					var percIndex:Int = 0;
					var rand:Float = Math.random() * 100;
					trace("level: " + level + ". perc: " + percIndex + ". compare: " +  PercentData[percIndex] + ". rand: " + rand);
					if (rand < PercentData[percIndex])
					{
						return true;
					}
					return false;
					
			}
		}
		
		return false;
	}
	
	public function GetSmallerNumber(perc:Int)
	{
		return (PercentData[perc] > PercentData[perc + 1] ? PercentData[perc + 1] : PercentData[perc]);
	}
	
	public function GetLargerNumber(perc:Int)
	{
		return (PercentData[perc] > PercentData[perc + 1] ? PercentData[perc] : PercentData[perc + 1]);
	}
	
}