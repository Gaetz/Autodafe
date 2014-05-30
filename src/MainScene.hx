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
		bulletTimer = 100;
		scoreTimer = 10;
		timer = 0;
		score = 0;
		hasEnded = false;
        super();
    }
	
	public override function begin()
	{
		addGraphic(new Text(getYearsText(locale)), 20, 10, 20);
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
				addGraphic(new Text(getBurntText(locale)), 20, HXP.bounds.width / 2 - 50,  HXP.bounds.height / 2 - 50);
				addGraphic(new Text(getRankText(locale) + " " + getRank(score, locale)), 20, HXP.bounds.width / 2 - 100,  HXP.bounds.height / 2);
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
			if ((timer % (Math.min(499, bulletTimer - Math.floor(score*2 / 10))) == 0))
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
	
	
	private function getBurntText(locale:String)
	{
		if (locale == "fr")
			return "Brule !";
		else if (locale == "de")
			return "Verbrannt!";
		else
			return "Burnt!";
	}
	
	private function getYearsText(locale:String)
	{
		if (locale == "fr")
			return "Annees :";
		else if (locale == "de")
			return "Jahre:";
		else
			return "Years:";
	}
	
	private function getRankText(locale:String)
	{
		if (locale == "fr")
			return "Rang :";
		else if (locale == "de")
			return "Rang:";
		else
			return "Rank:";
	}
	
	private function getRank(score:Int, locale:String)
	{
		if (locale == "fr")
		{
			if (score < 26)
				return "Marc Levy";
			else if (score >= 26 && score < 101)
				return "Honore d'Urfe";
			else if (score >= 101 && score < 301)
				return "Corneille";
			else if (score >= 301 && score < 501)
				return "Proust";
			else if (score >= 501 && score < 1001)
				return "Victor Hugo";
			else if (score >= 1001 && score < 3001)
				return "Chretien de Troyes";
			else if (score >= 3001 && score < 4001)
				return "Homere";
			else
				return "Peinture rupestre";
		}
		else if (locale == "de")
		{
			if (score < 26)
				return "Poppy J. Andersen";
			else if (score >= 26 && score < 101)
				return "Theodore Fontan";
			else if (score >= 101 && score < 301)
				return "Elfriede Jelinek";
			else if (score >= 301 && score < 501)
				return "Brecht";
			else if (score >= 501 && score < 1001)
				return "Goethe";
			else if (score >= 1001 && score < 3001)
				return "Cicerone";
			else if (score >= 3001 && score < 4001)
				return "Homere";
			else
				return "Mahabharata";
		}
		else {
			if (score < 26)
				return "Dan Brown";
			else if (score >= 26 && score < 101)
				return "Thomas Hardy";
			else if (score >= 101 && score < 301)
				return "Jane Austen";
			else if (score >= 301 && score < 501)
				return "Tolkien";
			else if (score >= 501 && score < 1001)
				return "Shakespeare";
			else if (score >= 1001 && score < 3001)
				return "Virgile";
			else if (score >= 3001 && score < 4001)
				return "Homere";
			else
				return "Mahabharata";
		}
	}
}