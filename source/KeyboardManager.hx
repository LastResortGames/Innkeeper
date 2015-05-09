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

	public var DefaultBindings:Map<String,Array<String>>;
	public var KeyBindings:Map<String,Array<String>>;
	public var SavedBindings:Map<String,Map<String,Array<String>>>;
	
	public function new() 
	{
		DefaultBindings = new Map<String,Array<String>>();
		KeyBindings = new Map<String, Array<String>>();
		SavedBindings = new Map<String,Map<String,Array<String>>>();
		
	}
	
	public function AddKey(key:String, binding:Array<String>,def:Bool = false)
	{
		if (def && !DefaultBindings.exists(key))
		{
			DefaultBindings.set(key, binding);
		}
		else if(def)
		{
			var setKeys:Array<String> = DefaultBindings.get(key);
			for (k in binding)
			{
				if (setKeys.indexOf(k) == -1)
				{
					setKeys.push(k);
				}
			}
			DefaultBindings.set(key, setKeys);
		}
		if (!KeyBindings.exists(key))
		{
			KeyBindings.set(key, binding);
		}
		else
		{
			var setKeys:Array<String> = KeyBindings.get(key);
			for (k in binding)
			{
				if (setKeys.indexOf(k) == -1)
				{
					setKeys.push(k);
				}
			}
			KeyBindings.set(key, setKeys);
		}
	}
	
	public function GetKeyPressed(key:String)
	{
		return FlxG.keys.anyJustPressed(KeyBindings.get(key));
	}
	
	public function GetKeyHeld(key:String)
	{
		return FlxG.keys.anyPressed(KeyBindings.get(key));
	}
	
	public function ReplaceKey(key:String, binding:Array<String>)
	{
		if (KeyBindings.exists(key))
		{
			KeyBindings.set(key, binding);			
		}
	}
	
	public function ResetDefaults()
	{
		for (k in DefaultBindings.keys())
		{
			KeyBindings.set(k, DefaultBindings.get(k));
		}
	}
	
	public function SaveBindings(key:String)
	{
		SavedBindings.set(key, KeyBindings);
	}
	
	
	
	
}