package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import EnumReg;

/**
 * ...
 * @author Last Resort Games
 */
class InitializeState extends FlxState
{

	override public function create():Void
	{		
		
		super.create();
		Reg.keymanage = new KeyboardManager();
		Reg.keymanage.AddKey("Confirm", ["SPACE"]);
		Reg.keymanage.AddKey("Test", ["R","T"]);
		
		
		
		//After initializing data switch to first Game State
		FlxG.switchState(new MainMenuState());		
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
}