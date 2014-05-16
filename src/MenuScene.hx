package ;

import com.haxepunk.Scene;
import entities.MenuItem;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

/**
 * Starting menu scene
 * @author Gaetz
 */
class MenuScene extends Scene
{
	var items:Array<MenuItem>;
	var index:Int;
	
	public function new() 
	{
		super();
	}
	
	public override function begin()
	{
		index = 0;
		items = new Array<MenuItem>();
		items[0] = new MenuItem( 130, 150, "Play" );
		items[1] = new MenuItem( 130, 160, "Language" );
		items[0].isSelected = true;	
		add(items[0]);
		add(items[1]);
	}
	
	public override function update() 
	{

		if (Input.check(Key.DOWN))
		{
			index++;
			for (i in 0...items.length - 1)
			{
				items[i].isSelected = false;
			}
			items[index].isSelected = true;
		}
		if (Input.check(Key.UP))
		{
			index--;
			for (i in 0...items.length - 1)
			{
				items[i].isSelected = false;
			}
			items[index].isSelected = true;
		}
		super.update();
	}
}