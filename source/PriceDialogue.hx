package;

import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.util.FlxMath;

/**
 * ...
 * @author Last Resort Games
 */
class PriceDialogue extends DialogueBox
{
	
	public var price:DialogueBox;
	public var PriceText:Array<FlxText>;
	public var PriceValues:Array<Int>;
	public var MaxDigits:Int;
	
	public var DigitID:Int;
	public var prevID:Int;
	public var UpArrows:Array<FlxSprite>;
	public var DownArrows:Array<FlxSprite>;
	public var DigitBG:Array<FlxSprite>;

	public function new(X:Float, Y:Float, Width:Int, Height:Int) 
	{
		super(X, Y, Width, Height);
		MaxDigits = 5;
		PriceText = new Array<FlxText>();
		PriceValues = new Array<Int>();
		DigitBG = new Array<FlxSprite>();
		nsl.AddToStage(X, Y);
		DigitID = 3;
		for (i in 0...MaxDigits)
		{
			if (i != DigitID)
			{
				DigitBG.push(new FlxSprite(X - Width / 2 + 9 + i * 34, Y - Height / 2 + 32, ArtReg.GetSprite("digitBG")));
			}
			else
			{
				DigitBG.push(new FlxSprite(X - Width / 2 + 9 + i * 34, Y - Height / 2 + 32, ArtReg.GetSprite("digitBGSel")));
			}
			PriceValues.push(0);
			PriceText.push(new FlxText(X - Width / 2 + 14 + i * 34, Y - Height / 2 + 5 + 32, 64, PriceValues[i] +"", 30));
			PriceText[i].color = FlxColor.BLACK;			
			DigitBG[i].setGraphicSize(32, 48);
			
			DigitBG[i].updateHitbox();
			FlxG.state.add(DigitBG[i]);
			FlxG.state.add(PriceText[i]);
		}
		nsl.AddToStage(X, Y);
		nsl.AddClickAndDragMouseEvents();
	}
	
	public var rHeld:Int;
	public var lHeld:Int;
	
	override public function update()
	{
		prevID = DigitID;
		if (Reg.keymanage.GetKeyPressed("MoveOptionLeft"))
		{			
			DigitID = Std.int(FlxMath.bound(DigitID - 1, 0, MaxDigits));
		}
		else if (Reg.keymanage.GetKeyPressed("MoveOptionRight"))
		{
			DigitID = Std.int(FlxMath.bound(DigitID + 1, 0, MaxDigits));	
		}
		if (prevID != DigitID)
		{		
			DigitBG[prevID].loadGraphic(ArtReg.GetSprite("digitBG"));			
			DigitBG[DigitID].loadGraphic(ArtReg.GetSprite("digitBGSel"));	
		}
		if (Reg.keymanage.GetKeyPressed("RaiseNumber") || Reg.keymanage.GetKeyHeld("RaiseNumber"))
		{
			rHeld++;
			if (Reg.keymanage.GetKeyPressed("RaiseNumber") || rHeld > 5)
			{
				rHeld = 0;
				CheckDigitOverNine(DigitID);
			}
		}
		else if (Reg.keymanage.GetKeyPressed("LowerNumber") || Reg.keymanage.GetKeyHeld("LowerNumber"))
		{
			lHeld++;
			if (Reg.keymanage.GetKeyPressed("LowerNumber") || lHeld > 5)
			{
				lHeld = 0;
				CheckDigitLessThanZero(DigitID);
			}
		}
		for (i in 0...MaxDigits)
		{
			PriceText[i].text = PriceValues[i] +"";
		}
		nsl.updateClickMovement();
		for (i in 0...MaxDigits)
		{
			DigitBG[i].setPosition(nsl.Center.x - Width / 2 + 9 + i * 34, nsl.Center.y - Height / 2 + 32);			
			PriceText[i].setPosition(nsl.Center.x - Width / 2 + 14 + i * 34, nsl.Center.y - Height / 2 + 5 + 32);
		}
		
	}
	
	public function CheckDigitOverNine(id:Int)
	{
		var tempID:Int = id;
		if (tempID < 0)
		{
			for (i in 0...MaxDigits)
			{
				PriceValues[i] = 9;
			}
		}
		else
		{
			PriceValues[tempID] = PriceValues[tempID] +1;
			if(PriceValues[tempID]> 9)
			{
				PriceValues[tempID] = 0;
				CheckDigitOverNine(id - 1);
			}
		}
	}
	
	public function CheckDigitLessThanZero(id:Int)
	{
		var tempID:Int = id;
		if (tempID < 0)
		{
			for (i in 0...MaxDigits)
			{
				PriceValues[i] = 0;
			}
		}
		else
		{
			PriceValues[tempID] = PriceValues[tempID] -1;
			if(PriceValues[tempID] < 0)
			{
				PriceValues[tempID] = 9;
				CheckDigitLessThanZero(id - 1);
			}
		}
	}
	
}