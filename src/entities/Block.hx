package entities;

import com.haxepunk.Entity;
import com.haxepunk.Graphic;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.HXP;

/**
 * A moving block
 * @author Gaetz
 */
class Block extends Entity
{
	private var speed: Int;
	
	public function new(x:Int=0, y:Int=0) 
	{
		super(x, y);
		speed = 10;
		graphic = new Image("graphics/block.png");
		setHitbox(32, 32);
		type = "player";
	}
	
	public override function update()
	{
		updateInput();
		// Collision
		var e:Entity = collide("bullet", x, y);
		if (e != null)
		{
			var b:Bullet = cast(e, Bullet);
			b.destroy();
			this.visible = false;
		}
		
		super.update();
	}
	
	private function updateInput()
	{
		if (Input.check(Key.LEFT))
		{
			if(x > speed) moveBy(-speed, 0);
		}
		if (Input.check(Key.RIGHT))
		{
			if (x < HXP.stage.stageWidth - width) moveBy(speed, 0);
		}
		if (Input.check(Key.UP))
		{
			if(y > speed) moveBy(0, -speed);
		}
		if (Input.check(Key.DOWN))
		{
			if (y < HXP.stage.stageHeight - height) moveBy(0, speed);
		}
	}
	
}