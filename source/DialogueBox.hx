package;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.system.layer.frames.FlxFrame;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Last Resort Games
 */
class DialogueBox extends BaseSprite
{
	/**
	 * The text being displayed
	 */
	public var textToDisplay:String;
	/**
	 * The amount of time before next character shows up.
	 */
	public var timePerTick:Float;
	
	public var characterTimer:Float;
	/**
	 * The index of the character last displayed
	 */
	public var displayIndex:Int;
	
	public var textBox:FlxText;
	
	public var contText:Bool;
	
	public var halfouter:Int;
	public var innerWid:Int;
	public var innerHt:Int;
	public var Width:Int;
	public var Height:Int;
	public var Center:FlxPoint;
	
	public var DialogShown:Bool;
	
	public var nsl:NineSpliceFlxSprite;

	public function new(X:Float, Y:Float, width:Int, height:Int ) 
	{
		super(X, Y);
		DialogShown = false;
		Center = new FlxPoint(X, Y);
		Width = width;
		Height = height;
		halfouter = 8;
		innerWid = width - 16;
		innerHt = height - 16;
		if (Width > 64)
		{
			innerWid = Width - 64;
			halfouter = 16;
		}
		if (Height > 64)
		{
			innerHt = Height - 64;
			halfouter = 16;
		}
		if (Width > 128)
		{
			innerWid = Width - 128;
			halfouter = 32;
		}
		if (Height > 128)
		{
			innerHt = Height - 128;
			halfouter = 32;
		}
		
		textBox = new FlxText(X - (innerWid/2) - halfouter, Y-(innerHt/2)- halfouter, innerWid + (halfouter * 2), "", 20);
		nsl = new NineSpliceFlxSprite("nineslice");
		nsl.ResizeSlices(Width, Height, new FlxPoint(X, Y));
		
		timePerTick = 0;
		characterTimer = 0;
		displayIndex = 0;
		contText = false;
		
	}
	
	public function RemoveTextFromScreen()
	{
		FlxG.state.remove(textBox, true);
	}
	
	public function AddTextToScreen()
	{
		FlxG.state.add(textBox);
	}
	
	public function IsTextDone():Bool
	{
		return contText; 
	}
	
	/**
	 * Set Dialogue Boxes Text
	 * @param	text - Text to display. May be split if too long.
	 * @param	spd - Amount of milliseconds between characters (-1 for instantaneous)
	 */
	public function SetText(text:String, spd:Float)
	{
		textToDisplay = text;
		timePerTick = spd;
	}
	
	override public function update()
	{
		super.update();
		
		if (Reg.keymanage.GetKeyPressed("Confirm"))
		{
			if (textToDisplay.length == displayIndex)
			{
				contText = true;
			}
			timePerTick = -1;
			
		}
		if (timePerTick != -1 && displayIndex != textToDisplay.length)
		{
			textBox.text = textToDisplay.substr(0, displayIndex);
			characterTimer += FlxG.elapsed;
			if (characterTimer * 1000 > timePerTick)
			{
				displayIndex += Std.int((characterTimer * 1000) / timePerTick);
				characterTimer = ((characterTimer * 1000) % timePerTick) / 1000;
			}
		}
		else
		{
			displayIndex = textToDisplay.length;
			textBox.text = textToDisplay;
		}
		
		
	}
	
	
	
}