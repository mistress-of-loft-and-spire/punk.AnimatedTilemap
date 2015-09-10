package net.flashpunk.graphics
{

	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.FP;

	/**
	 * Tilemap addition to enable defining animated tiles.
	 * @author voec
	 */
	public class AnimatedTilemap extends Tilemap
	{
		
		/**
		 * Animation speed factor, alter this to speed up/slow down all animations.
		 */
		public var rate:Number;
		
		/**
		 * Constructor.
		 * @param	tileset			The source tileset image.
		 * @param	width			Width of the tilemap, in pixels.
		 * @param	height			Height of the tilemap, in pixels.
		 * @param	tileWidth		Tile width.
		 * @param	tileHeight		Tile height.
		 */
		public function AnimatedTilemap(tileset:*, width:uint, height:uint, tileWidth:uint, tileHeight:uint) 
		{
			
			super(tileset, width, height, tileWidth, tileHeight);
			
			rate = 1;
			
			active = true;
			
		}
		
		/** @private Updates the animation. */
		override public function update():void
		{
			
			if (_anims != null)
			{
				
				//go through each animation in _anims array
				for (var a:int = 0; a < _anims.length; a++)
				{
					
					_anims[a]._timer += (FP.fixed ? _anims[a]._frameRate / FP.assignedFrameRate : _anims[a]._frameRate * FP.elapsed) * rate;
					
					if (_anims[a]._timer >= 1)
					{
						while (_anims[a]._timer >= 1)
						{
							_anims[a]._timer -= 1;
							_anims[a]._index += 1; //increase frame index
							
							//if last index -> go back to first frame (loop)
							if (_anims[a]._index == _anims[a]._frames.length)
							{
								_anims[a]._index = 0;
							}
						}
						
						//for each tile that needs to be animated
						for (var b:int = 0; b < _anims[a]._tiles.length; b++)
						{
							setTile(int(_anims[a]._tiles[b] % columns), int(_anims[a]._tiles[b] / columns), _anims[a]._frames[_anims[a]._index]);
							//I don't even...
							
						}
						
						
					}
				}
			}
			
			super.update();
			
			
		}
		
		/**
		 * Add an animation to tiles in the Tilemap.
		 * @param	frames		Array of frame indices to animate through. The first frame should be the 1D index of the tile used when drawing the tilemap.
		 * @param	frameRate	Animation speed (in frames per second, 0 defaults to assigned frame rate)
		 */
		public function animate(frames:Array, frameRate:Number = 0):void
		{
			
			// Search through tilemap for all tiles that need to be animated and mark them down in array
			var tiles:Array = new Array();
			for (var y:int = 0; y < rows; y++)
			{
				for (var x:int = 0; x < columns; x++)
				{
					if (getTile(x, y) == frames[0]) tiles.push(x + (y * columns));
					//x + (y * columns) -> getting the 1D index of a tile in the tilemap
				}
			}
			
			// Add to _anims array
			_anims.push(new Animation(frames, frameRate, tiles));
			
		}
		
		//Create an array to hold all the animations
		private var _anims:Array = new Array();
		
	}
}

internal class Animation
{
    public var _frames:Array;
    public var _frameRate:Number;
    public var _tiles:Array;
	public var _timer:Number;
	public var _index:int;

	/**
	 * Little helper class for defining animations.
	 */
    public function Animation(frames:Array, frameRate:Number, tiles:Array)
    {
        _frames = frames;
		_frameRate = frameRate;
		_tiles = tiles;
		_timer = 0;
		_index = 0;

    }

}
