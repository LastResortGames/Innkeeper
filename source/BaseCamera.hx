package;

import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

/**
 * ...
 * @author Last Resort Games
 */
class BaseCamera extends FlxCamera
{
	var Marker:FlxSprite;
	var CornerMarker:FlxSprite;
	var CamID:Int;
	
	
	public function new(X:Int,Y:Int, Width:Int, Height:Int, BottomLeftX:Int,BottomLeftY:Int)
	{
		super(X, Y, Width, Height);
		var CenterX:Int = Std.int(BottomLeftX + (Width / 2));
		var CenterY:Int = Std.int(BottomLeftY - (Height / 2));
		Marker = new FlxSprite( CenterX, CenterY);
		this.follow(Marker);
		FlxG.cameras.add(this);
		CamID = FlxG.cameras.list.length - 1;
		bgColor = 0x0;
	}
	
	public function AddToScene(State:FlxState)
	{
		State.add(this);
		State.add(Marker);
	}
	
	public function ZoomIn(zoom:Float = .9)
	{
		set_zoom(zoom);
	}
	
	/**
	 * De/Activate Camera
	 * @param	active state you want camera to be in.
	 */
	 
	public function ActivateCamera(active:Bool)
	{
		set_active(active);
	}
	
	/**
	 * Show/Hide Camera
	 * @param	show Visibility of camera
	 */
	public function ShowCamera(show:Bool)
	{
		set_visible(show);
	}
	
	/**
	 * Move Camera around using it's marker
	 * 
	 * @param	RelX Relative X Position 
	 * @param	RelY Relative Y Position
	 */
	public function ShiftCamera(RelX:Int, RelY:Int)
	{
		Marker.x += RelX;
		Marker.y += RelY;
	}
	
	public function MoveCamera(NewX:Int, NewY:Int)
	{
		Marker.x = NewX;
		Marker.y = NewY;
	}
	
	public function TurnCameraOn()
	{
		ActivateCamera(true);
		ShowCamera(true);
	}
	
	public function TurnCameraOff()
	{
		ActivateCamera(false);
		ShowCamera(false);
	}
	
	
}