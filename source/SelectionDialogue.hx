package;

import flixel.FlxG;

/**
 * ...
 * @author Last Resort Games
 */
class SelectionDialogue extends DialogueBox
{
	
	public var Options:Array<DataFlxButton>;
	
	
	public function new(X:Float, Y:Float, Width:Int, Height:Int)
	{
		super(X, Y, Width, Height);
		Options = new Array<DataFlxButton>();
	}
	
	public function SetOptions(arr:Array<DataFlxButton>)
	{
		Options = Options.concat(arr);		
	}
	
	public function ShowDialog()
	{
		DialogShown = true;
		nsl.AddToStage(Center.x, Center.y);
		AddTextToScreen();
		for (i in 0...Options.length)
		{
			Options[i].setPosition(Center.x - (innerWid / 2) - halfouter + (i * innerWid), Center.y - (innerHt / 2) - halfouter + halfouter);
			FlxG.state.add(Options[i]);
		}
	}
	
	public function HideDialog()
	{
		DialogShown = false;
		nsl.RemoveFromStage();
		RemoveTextFromScreen();
		for (i in 0...Options.length)
		{
			FlxG.state.remove(Options[i]);
		}
	}
	
	/**
	 * Set Dialogue Boxes Text
	 * @param	text - Text to display. May be split if too long.
	 * @param	spd - Amount of milliseconds between characters (-1 for instantaneous)
	 */
	override public function SetText(text:String, spd:Float)
	{
		textToDisplay = text;
		timePerTick = spd;
		textBox.text = textToDisplay;
	}
	
	override public function update()
	{
		textBox.text = textToDisplay;
		
	}
	
}