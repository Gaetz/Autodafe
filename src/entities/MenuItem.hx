package entities;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Text;
import com.haxepunk.Mask;

/**
 * Item
 * @author Gaetz
 */
class MenuItem extends Entity
{
	public var isSelected : Bool;
	public var selectedText : Text;
	public var idleText : Text;
	
	public function new(x:Int, y:Int, text:String) 
	{
		super(x, y);
		idleText = new Text(text, x, y, 200, 50, { color: 0xFF0000 });
		selectedText = new Text(text, x, y, 200, 50, { color: 0xFF0000 });
		//selectedText.visible = false;
		graphic = idleText;
	}
	
	public override function update()
	{
		if (isSelected)
		{
			selectedText.visible = true;
			idleText.visible = false;
			graphic = selectedText;
		} 
		else 
		{
			idleText.visible = true;
			selectedText.visible = false;
			graphic = idleText;
		}
		super.update();
	}
	
}