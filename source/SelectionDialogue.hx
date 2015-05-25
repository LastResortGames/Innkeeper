package;

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
	
}