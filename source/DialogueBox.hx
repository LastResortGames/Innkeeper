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
	
	

	public function new(X:Float, Y:Float, Width:Int, Height:Int ) 
	{
		super(X, Y);
		
		var innerWid:Int = Width - 16;
		var innerHt:Int = Height - 16;
		if (Width > 128)
		{
			innerWid = Width - 128;
		}
		if (Height > 128)
		{
			innerHt= Height - 128;
		}
		
		textBox = new FlxText(X - (innerWid/2), Y-(innerHt/2), 200, "", 14);
		textBox.setBorderStyle(FlxText.BORDER_OUTLINE,0xf);
		
		timePerTick = 0;
		characterTimer = 0;
		displayIndex = 0;
		
		var nsl:NineSpliceFlxSprite = new NineSpliceFlxSprite("assets/images/nineslice", ".png");
		nsl.ResizeSlices(Width, Height, new FlxPoint(X, Y));
		FlxG.state.add(textBox);
		
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
			timePerTick = -1;
		}
		if (timePerTick != -1)
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
			textBox.text = textToDisplay;
		}
		
		
	}
	
	
	
}