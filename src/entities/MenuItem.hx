package entities;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.Mask;

/**
 * Item
 * @author Gaetz
 */
class MenuItem extends Entity
{
	public var isSelected : Bool;
	public var selected : Image;
	public var idle : Image;
	
	public function new(x:Int, y:Int, locale:String) 
	{
		super(x, y);
		idle = new Image("graphics/flag-idle_"+locale+".png");
		selected = new Image("graphics/flag-selected_"+locale+".png");
		selected.visible = false;
		graphic = idle;
	}
	
	public override function update()
	{
		if (isSelected)
		{
			selected.visible = true;
			idle.visible = false;
			graphic = selected;
		} 
		else 
		{
			idle.visible = true;
			selected.visible = false;
			graphic = idle;
		}
		super.update();
	}
	
}