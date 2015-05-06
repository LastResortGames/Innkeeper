package;
import flixel.text.FlxText;
import flixel.FlxG;

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

	public function new(X:Float, Y:Float, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y, SimpleGraphic);
		textBox = new FlxText(10, 10, 200, "", 14);
		textBox.setBorderStyle(FlxText.BORDER_OUTLINE,0xf);
		//FlxG.state.add(textBox);
		timePerTick = 0;
		characterTimer = 0;
		displayIndex = 0;
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
			trace("hey");
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
			trace("hey2");
			textBox.text = textToDisplay;
		}
		
		
	}
	
	
	
}