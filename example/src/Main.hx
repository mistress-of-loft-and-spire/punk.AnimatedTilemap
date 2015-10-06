import com.haxepunk.Engine;
import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.RenderMode;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.World;
import com.haxepunk.graphics.AnimatedTilemap;
import openfl.Assets;
import openfl.display.StageAlign;
import openfl.display.StageDisplayState;
import openfl.display.StageQuality;
import openfl.display.StageScaleMode;
import openfl.Lib;
import openfl.system.System;

	/**
	 * ...
	 * @author VoEC
	 */

class Main extends Engine
	{
		
		
		override public function init():Void
		{
			trace("HaxePunk has started successfully!");
			
			var myworld:World = new World();
			var mytileset:AnimatedTilemap = new AnimatedTilemap("src/tileset.png", 1024, 1024, 32, 32);
			
			HXP.world = myworld;
			
			myworld.add(new Entity(0,0,mytileset));
			
			var i:Int; var j:Int;
			for (i in 0...32)
			{
				for (j in 0...32)
				{
					mytileset.setTile(i, j, HXP.choose(0, 0, 1, 2, 3, 8, 7, 6, 16));
				}
				
			}
			
			mytileset.animate([8, 9, 10, 11], 2);
			
			mytileset.animate([16, 17, 18], 4);
			
		}
	

	public static function main() { new Main(); }

}