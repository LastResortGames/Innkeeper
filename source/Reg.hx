package;

import flixel.util.FlxSave;
import EnumReg;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	public static var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];
	
	public static var CurrentGameState:EnumValue = GameState.STARTMENU;
	
	public static var RowDelim:String = "\r";
	public static var ColDelim:String = "|";
	
	public static var CurrentTimer:Float = 0;
	
	public static var keymanage:KeyboardManager;
	
	public static var AvailableRooms:Array<Room>;
	public static var RoomChosen:Bool;
	public static var PriceChosen:Bool;
	public static var PriceAccepted:Bool;
	public static var ChosenRoom:Int;
	public static var RoomPrice:Int;
	
}