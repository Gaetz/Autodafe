import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.Scene;
import entities.Block;
import entities.Bullet;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import entities.ScoreCounter;

class MainScene extends Scene
{
	var player:Block;
	var counter:ScoreCounter;
	
	var locale:String;
	var bulletTimer:Int;
	var scoreTimer:Int;
	var timer:Int;
	public var score:Int;

	var hasEnded:Bool;
	
    public function new(locale:String)
    {
		this.locale = locale;
		bulletTimer = 40;
		scoreTimer = 10;
		timer = 0;
		score = 0;
		hasEnded = false;
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
		if (!player.visible)
		{
			// Add end text
			if (!hasEnded)
			{
				addGraphic(new Text("Burnt!"), 20, HXP.bounds.width / 2 - 50,  HXP.bounds.height / 2 - 50);
				addGraphic(new Text("Rank:"), 20, HXP.bounds.width / 2 - 100,  HXP.bounds.height / 2);
				hasEnded = true;
			} 
			// Wait input to go to menu
			else 
			{
				if (Input.released(Key.ENTER) || Input.released(Key.SPACE))
				{
					removeAll();
					HXP.scene = new MenuScene(locale);
				}
			}
		}
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
		// Update
		super.update();
	}
}