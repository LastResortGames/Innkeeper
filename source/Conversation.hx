package;

import flixel.util.FlxPoint;

/**
 * ...
 * @author Last Resort Games
 */
class Conversation
{
	
	public var Dialog:Map<Int,DialogueBox>;
	public var numDialog:Int;
	
	public var CurrDIndex:Int;
	public var CurrDialog:DialogueBox;
	
	public var nsl:NineSpliceFlxSprite;
	
	public var NoMoreText:Bool;
	
	public var pos:FlxPoint;
	public var WdHt:FlxPoint;
	
	public function new(X:Float, Y:Float,Width:Int, Height:Int) 
	{
		Dialog = new Map<Int,DialogueBox>();
		pos = new FlxPoint(X, Y);
		WdHt = new FlxPoint(Width, Height);
		numDialog = 0;
		CurrDIndex = 0;
		
	}
	
	public function update()
	{
		if(!NoMoreText && CurrDialog != null)
		{
			CurrDialog.update();
			if (CurrDialog.IsTextDone())
			{
				ContinueToNextDialogue();
			}
		}		
	}
	
	public function AddDialog(txt:String, spd:Int)
	{
		Dialog.set(numDialog, new DialogueBox(pos.x,pos.y,Std.int(WdHt.x),Std.int(WdHt.y)));
		Dialog.get(numDialog).SetText(txt, spd);
		numDialog++;
	}
	
	public function ContinueToNextDialogue()
	{
		if (CurrDialog != null)
		{
			CurrDialog.RemoveTextFromScreen();
		}
		CurrDialog = Dialog.get(CurrDIndex);
		if (CurrDialog != null)
		{
			CurrDialog.AddTextToScreen();
		}
		else
		{
			NoMoreText = true;
		}
		CurrDIndex++;
	}
	
}