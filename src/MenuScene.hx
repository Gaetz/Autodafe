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
	
	public function new(locale:String = "") 
	{
		switch(locale)
		{
			case "en":
				index = 1;
			case "de":
				index = 2;
			default:
				index = 0;
		}
		super();
	}
	
	public override function begin()
	{
		// Title
		addGraphic(new Text("Autodafe"), 0, 250, 200);
		// Flags
		items = new Array<MenuItem>();
		items[0] = new MenuItem( 140, 250, "fr" );
		items[1] = new MenuItem( 250, 250, "en" );
		items[2] = new MenuItem( 360, 250, "de" );
		items[index].isSelected = true;	
		add(items[0]);
		add(items[1]);
		add(items[2]);
	}
	
	public override function update() 
	{
		// Choose language
		if (Input.released(Key.RIGHT))
		{
			index = (index + 1) % 3;
			for (i in 0...items.length)
			{
				items[i].isSelected = false;
			}
			items[index].isSelected = true;
		}
		if (Input.released(Key.LEFT))
		{
			index = (index + 2) % 3;
			for (i in 0...items.length)
			{
				items[i].isSelected = false;
			}
			items[index].isSelected = true;
		}
		// Start game selecting locale
		if (Input.released(Key.ENTER) || Input.released(Key.SPACE))
		{
			var locale = "";
			switch (index) {
				case 0:
					locale = "fr";
				case 1:
					locale = "en";
				case 2:
					locale = "de";
				default:
					locale = "fr";
			}
			removeAll();
			HXP.scene = new MainScene(locale);
		}
		// Update
		super.update();
	}
}