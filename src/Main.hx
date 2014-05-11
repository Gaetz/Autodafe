import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine
{

	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		HXP.stage.stageWidth = 400;
		HXP.stage.stageHeight = 400;
		HXP.scene = new MainScene();
	}

	public static function main() { new Main(); }

}