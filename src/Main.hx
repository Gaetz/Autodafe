import com.haxepunk.Engine;
import com.haxepunk.HXP;
import flash.geom.Rectangle;

class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		HXP.bounds = new Rectangle(0, 0, 600, 600);
		HXP.scene = new MainScene();
	}

	public static function main() { new Main(); }

}