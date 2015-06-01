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
		Reg.keymanage.AddKey("Test", ["R", "T"]);
		Reg.keymanage.AddKey("RaiseNumber", ["UP", "W"]);
		Reg.keymanage.AddKey("LowerNumber", ["DOWN", "S"]);
		Reg.keymanage.AddKey("MoveOptionLeft", ["LEFT", "A"]);
		Reg.keymanage.AddKey("MoveOptionRight", ["RIGHT", "D"]);
		
		
		var read:ReadInFile = new ReadInFile(AssetPaths.SpritePaths__xml,NOTHING);
		ArtReg.ArtMap = read.ReadXMLFile();
		Reg.AvailableRooms = new Array<Room>();
		
		//After initializing data switch to first Game State
		FlxG.switchState(new MainMenuState());		
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
}