package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.input.keyboard.FlxKey;
/**
 * ...
 * @author Last Resort Games
 */
class MainMenuState extends FlxState
{
	public var GameName:FlxText;
	public var PlayGame:FlxButton;
	public var Credits:FlxText;
	public var Instructions:FlxText;
	
	override public function create():Void
	{
		super.create();
		
		
		GameName = new FlxText(FlxG.width / 2.5, 20, FlxG.width / 2, "Base Game", 24);
		add(GameName);
		var Instructions2:FlxText = new FlxText(10, 75,FlxG.width/3, "Here are some instructions",14);
		add(Instructions2);
		PlayGame = new FlxButton(FlxG.width / 2.8, 150, "Play Game", StartGame);
		PlayGame.loadGraphic(AssetPaths.buttonSelected__png);
		PlayGame.label.size = 24;
		add(PlayGame);
		Instructions = new FlxText(FlxG.width / 3, 75,FlxG.width/3, "Here are some instructions",14);
		add(Instructions);
		Credits = new FlxText(32, FlxG.height - 32, FlxG.width - 64, "Credits: Programming/Design: Last Resort Games. Art: www.kenney.nl.", 12);
		add(Credits);
		
				
	}
	
	override public function update():Void
	{
		super.update();
		
	}
	
	public function StartGame()
	{
		FlxG.switchState(new LevelState());
	}
}