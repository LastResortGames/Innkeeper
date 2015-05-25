package;

import flixel.ui.FlxButton;
import flixel.ui.FlxTypedButton;

/**
 * ...
 * @author Last Resort Games
 */
class DataFlxButton extends FlxButton
{
	public var DataID:Int;
	public var DataValue:String;

	public function new(X:Float = 0, Y:Float = 0, ?Text:String, ?OnClick:Void->Void)
	{
		super(X, Y, Text, OnClick);
	}
	
	public function setOnUp()
	{
		onUp.callback = CheckHeroesIn;
	}
	
	public function CheckHeroesIn()
	{
		if (!Reg.RoomChosen)
		{
			Reg.RoomChosen = true;
			Reg.ChosenRoom = DataID;
		}
	}
	
	public function RejectChosenPrice()
	{
		
	}
	
	public function AcceptChosenPrice()
	{
		
	}
	
	
}