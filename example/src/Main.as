package
{
import net.flashpunk.Engine;
import net.flashpunk.Entity;
import net.flashpunk.FP;
import net.flashpunk.graphics.AnimatedTilemap;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
import net.flashpunk.World;


	public class Main extends Engine
	{
		
		[Embed(source = 'tileset.png')] private const TILESET:Class;
		
		public function Main()
		{
			super(1024, 1024, 60, false);
			
			FP.console.enable();
		}
		private var mytileset:AnimatedTilemap = new AnimatedTilemap(TILESET, 1024, 1024, 32, 32);
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
			
			var myworld:World = new World();
			
			
			FP.world = myworld;
			
			myworld.add(new Entity(0,0,mytileset));
			
			for (var i:int = 0; i < 32; i++)
			{
				for (var j:int = 0; j < 32; j++)
				{
					mytileset.setTile(i, j, FP.choose(0, 0, 1, 2, 3, 8, 7, 6, 16));
				}
				
			}
			
			mytileset.animate([8, 9, 10, 11], 2);
			
			mytileset.animate([16, 17, 18], 4);
			
		}
		
		override public function update():void
		{
			
			if (Input.pressed(Key.H))
			{
				for (var i:int = 0; i < 32; i++)
			{
				for (var j:int = 0; j < 32; j++)
				{
					mytileset.setTile(i, j, FP.choose(0, 0, 1, 2, 3, 8, 7, 6, 16));
				}
				
			}
			}
			
			super.update();
			
		}
	}
}
