package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.math.Vector;

/**
 * A bullet that threaten the block
 * @author Gaetz
 */
class Bullet extends Entity
{
	private var direction : Int;
	private var speed : Int;
	
	public function new() 
	{
		direction = computeDirection();
		speed = 10;
		graphic = new Image("graphics/"+computeGraphicName()); 
		var startX = computeStartingX(direction);
		var startY = computeStartingY(direction);
		super(startX, startY);
		setHitbox(32, 32);
		type = "bullet";
	}
	
	public function destroy()
	{
		scene.remove(this);
	}
	
	private function computeDirection()
	{
		var rand = Math.random();
		if (rand < 0.25) return 2; // down
		else if (rand >= 0.25 && rand < 0.5) return 4; // left
		else if (rand >= 0.5 && rand < 0.75) return 8; // up
		else return 6; // right
	}
	
	private function computeGraphicName()
	{
		switch(direction)
		{
			case 2:
				return "bullet-down.png";
			case 4:
				return "bullet-left.png";
			case 8:
				return "bullet-up.png";
			case 6:
				return "bullet-right.png";
			default:
				return "bullet-right.png";
		}
	}
	
	private function computeStartingX(dir:Int)
	{
		switch(dir)
		{
			case 2:
				return Math.round(Math.random() * HXP.bounds.width);
			case 4:
				return Math.round(HXP.bounds.width);
			case 8:
				return Math.round(Math.random() * HXP.bounds.width);
			case 6:
				return 0;
			default:
				return 0;
		}
	}
	
	private function computeStartingY(dir:Int)
	{
		switch(dir)
		{
			case 2:
				return 0;
			case 4:
				return Math.round(Math.random() * HXP.bounds.height);
			case 8:
				return Math.round(HXP.bounds.height);
			case 6:
				return Math.round(Math.random() * HXP.bounds.height);
			default:
				return 0;
		}
	}
	
	public override function update()
	{
		var move = computeMove(direction);
		moveBy(move.x, move.y);

		if (x > HXP.bounds.width + 64 || x < -64
			|| y > HXP.bounds.height + 64 || y < -64)
		{
			scene.remove(this);
		}
		
		super.update();
	}
	
	private function computeMove(dir:Int) : Vector
	{
		switch(dir)
		{
			case 2:
				return new Vector(0, speed);
			case 4:
				return new Vector(-speed, 0);
			case 8:
				return new Vector(0, -speed);
			case 6:
				return new Vector(speed, 0);
			default:
				return new Vector(0, speed);
		}
	}
}