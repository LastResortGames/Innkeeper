package;

/**
 * ...
 * @author Last Resort Games
 */
class Conversation
{
	
	public var Dialog:Map<Int,DialogueBox>;
	public var numDialog:Int;
	
	public function new() 
	{		
		Dialog = new Map<Int,DialogueBox>();
		numDialog = 0;
	}
	
	public function AddDialog(dialog:DialogueBox)
	{
		
		Dialog.set(numDialog, dialog);
		numDialog++;
	}
	
}