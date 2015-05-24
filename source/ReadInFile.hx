package;

import flixel.FlxG;
import EnumReg;
import flixel.util.FlxPoint;
import haxe.xml.Fast;
import openfl.Assets;
import StringTools;

/**
 * ...
 * @author ...
 */
class ReadInFile
{
	
	var fName:String;
	
	//Variables Being Read in
	

	public function new(name:String,goal:EnumValue) 
	{
		fName = name;
		//ReadFile();
	}
	
	public function ReadXMLFile():Map<String,Array<String>>
	{
		var xml:Xml = Xml.parse(Assets.getText(fName));
		var fastXml:Fast = new Fast(xml.firstElement());
		var spriteText:Map<String, Array<String>> = new Map<String,Array<String>>();
		for (spr in fastXml.nodes.sprite)
		{
			if (!spr.nodes.option.isEmpty())
			{
				spriteText.set(spr.att.name, []);
				for (op in spr.nodes.option)
				{
					spriteText.get(spr.att.name).push(op.att.value);
				}
			}
			else
			{
				spriteText.set(spr.att.name, [spr.att.value]);
			}
		}
		return spriteText;
	}
	
	public function ReadFile()
	{
		var fileText:String = Assets.getText(fName);
		fileText = StringTools.replace(fileText, "\r\n", "\r");
		var rows:Array<String> = SplitRows(fileText);
		var lineNum:Int = 0;
		
		SetFileVariableDefaults();
		
		for(i in 1...rows.length)
		{
			var row:String = rows[i];
			var columnList:Array<String> = SplitCols(row);
			ReadColumnData(columnList);	
			lineNum++;
		}
		
	}
	
	public function SetFileVariableDefaults()
	{
		
	}
	
	public function ReadColumnData(cols:Array<String>)
	{
		for (i in 0...cols.length)
		{
			
		}
	}
	
	public function SplitRows(file:String):Array<String>
	{
		return file.split(Reg.RowDelim);
	}
	public function SplitCols(row:String):Array<String>
	{
		return row.split(Reg.ColDelim);
	}
	
	
	
	function GetDirection(dir:String):EnumValue
	{
		switch(dir)
		{
			case "N":
				return NORTH;
			case "NE":
				return NORTHEAST;
			case "NW":
				return NORTHWEST;
			case "S":
				return SOUTH;
			case "SE":
				return SOUTHEAST;
			case "SW":
				return SOUTHWEST;
			case "E":
				return EAST;
			case "W":
				return WEST;
				
		}
		return NORTH;
	}
	
	
	
}