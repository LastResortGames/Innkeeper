package;

import flixel.ui.FlxButton;
import flixel.ui.FlxTypedButton;

/**
 * ...
 * @author Last Resort Games
 */
class RoomSelectButton extends FlxButton
{
	public var RoomID:Int;

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
		trace("hi");
	}
	
}