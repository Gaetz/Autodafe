import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.Scene;
import entities.Block;
import entities.Bullet;
import com.haxepunk.HXP;
import entities.ScoreCounter;

class MainScene extends Scene
{
	var player:Block;
	var counter:ScoreCounter;
	var bulletTimer:Int;
	var scoreTimer:Int;
	var timer:Int;
	public var score:Int;
	
    public function new()
    {
		bulletTimer = 40;
		scoreTimer = 10;
		timer = 0;
		score = 0;
        super();
    }
	
	public override function begin()
	{
		addGraphic(new Text("Years:"), 20, 10, 20);
		player = add(new Block(Math.floor(HXP.bounds.width / 2), Math.floor(HXP.bounds.height / 2)));
		counter = add(new ScoreCounter());
		add(new Bullet());
	}
	
	public override function update() 
	{
		// End condition
		if(!player.visible)
			addGraphic(new Text("Burnt !"), 20, HXP.bounds.width / 2 - 50,  HXP.bounds.height / 2);
		// Game
		else
		{
			// Time
			timer++;
			// Bullets
			if ((timer % (bulletTimer - Math.floor(score / 10))) == 0)
			{
				add(new Bullet());	
			}
			// Score
			if (timer % scoreTimer == 0)
			{
				score++;
				counter.setScore(score);
			}
		}
		
		super.update();
	}
}