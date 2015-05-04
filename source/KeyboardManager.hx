package;

import openfl.utils.Dictionary;
import flixel.input.keyboard.FlxKey;
import flixel.FlxG;

/**
 * ...
 * @author Last Resort Games
 */
class KeyboardManager
{

	public var DefaultBindings:Map<String,FlxKey>;
	public var KeyBindings:Map<String,FlxKey>;
	public var SavedBindings:Map<String,Map<String,FlxKey>>;
	
	public function new() 
	{
		DefaultBindings = new Map<String,FlxKey>();
		KeyBindings = new Map<String, FlxKey>();
		SavedBindings = new Map<String,Map<String,FlxKey>>();
		
	}
	
	public function AddKey(key:String, binding:FlxKey,def:Bool = true)
	{
		if (def && !DefaultBindings.exists(key))
		{
			DefaultBindings.set(key, binding);
		}
		if (!KeyBindings.exists(key))
		{
			KeyBindings.set(key, binding);
		}
	}
	
	public function GetKeyPressed(key:String)
	{
		trace(FlxG.keys.anyJustPressed([KeyBindings.get(key).name]));
	}
	
	public function GetKeyHeld(key:String)
	{
		trace(FlxG.keys.anyPressed([KeyBindings.get(key).name]));
	}
	
	public function ReplaceKey(key:String, binding:FlxKey)
	{
		if (KeyBindings.exists(key))
		{
			KeyBindings.set(key, binding);			
		}
	}
	
	public function ResetDefaults()
	{
		//for (k in DefaultBindings.keys)
		//{
			//KeyBindings.set(k, DefaultBindings.get(k));
		//}
	}
	
	public function SaveBindings(key:String)
	{
		SavedBindings.set(key, KeyBindings);
	}
	
	
	
	
}