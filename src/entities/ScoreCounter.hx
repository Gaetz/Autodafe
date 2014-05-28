package entities;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Text;
import com.haxepunk.Mask;

/**
 * Show score
 * @author Gaetz
 */
class ScoreCounter extends Entity
{
	// Constructor
	public function new(x:Float=90, y:Float=20, graphic:Graphic=null, mask:Mask=null) 
	{
		graphic = new Text("O");
		super(x, y, graphic, mask);		
	}
	
	// Update score
	public function setScore(score:Int)
	{
		graphic.destroy();
		graphic = new Text("" + score);
		super.update();
	}
	
}