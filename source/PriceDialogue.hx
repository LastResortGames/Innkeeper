package;
import flixel.text.FlxText;

/**
 * ...
 * @author Last Resort Games
 */
class PriceDialogue extends DialogueBox
{
	
	public var price:DialogueBox;

	public function new(X:Float, Y:Float, Width:Int, Height:Int) 
	{
		super(X, Y, Width, Height);
		
		textBox = new FlxText(X - 50, Y - 50, 100, "");
	}
	
}