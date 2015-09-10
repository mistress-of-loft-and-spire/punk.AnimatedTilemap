package com.haxepunk.graphics;

import com.haxepunk.Graphic.TileType;
import com.haxepunk.graphics.Animation;
import com.haxepunk.graphics.Tilemap;
import com.haxepunk.HXP;

/**
 * Tilemap addition to enable defining animated tiles.
 * @author voec
 */
class AnimatedTilemap extends Tilemap
{
	
	/**
	 * Animation speed factor, alter this to speed up/slow down all animations.
	 */
	public var rate:Float;
	

	public function new(tileset:TileType, width:Int, height:Int, tileWidth:Int, tileHeight:Int, ?tileSpacingWidth:Int=0, ?tileSpacingHeight:Int=0, ?opaqueTiles:Bool=true) 
	{
		
		super(tileset, width, height, tileWidth, tileHeight, tileSpacingWidth, tileSpacingHeight, opaqueTiles);
		
		rate = 1;
		
		active = true;
		
	}
	
	/** @private Updates the animation. */
	override public function update()
	{
		
		
		if (_anims != null)
		{
			var a:Int;
			//go through each animation in _anims array
			for (a in 0..._anims.length)
			{
				//_anims[a][1] == frame rate
				//_anims[a][2] == tiles array
				//_anims[a][3] == timer for animation
				//_anims[a][4] == index of current frame
				
				_anims[a][3] += (HXP.fixed ? _anims[a][1] / HXP.assignedFrameRate : _anims[a][1] * HXP.elapsed) * rate;
				
				if (_anims[a][3] >= 1)
				{
					while (_anims[a][3] >= 1)
					{
						_anims[a][3] -= 1;
						_anims[a][4] += 1; //increase frame index
						
						//if last index -> go back to first frame (loop)
						if (_anims[a][4] == _anims[a][0].length)
						{
							_anims[a][4] = 0;
						}
					}
					
					var b:Int;
					//for each tile that needs to be animated
					for (b in 0..._anims[a][2].length)
					{
						setTile(Std.int(_anims[a][2][b] % columns), Std.int(_anims[a][2][b] / columns), _anims[a][0][_anims[a][4]]);
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
	public function animate(frames:Array<Int>, frameRate:Float = 0):Void
	{
		
		// Search through tilemap for all tiles that need to be animated and mark them down in array
		
		var x:Int; var y:Int;
		var tiles:Array<Int> = new Array();
		trace(rows + " rc " + columns);
		for (y in 0...rows)
		{
			for (x in 0...columns)
			{
				if (getTile(x, y) == frames[0]) tiles.push(x + (y * columns));
				//x + (y * columns) -> getting the 1D index of a tile in the tilemap
			}
		}
		
		var timer:Float = 0;
		var index:Int = 0;
		
		// Add to _anims array
		var temparray:Array<Dynamic> = [frames, frameRate, tiles, timer, index]; 
		_anims.push(temparray);
		
	}
	
	//Create an array of all the animations Array
	private var _anims:Array<Array<Dynamic>> = new Array();
	
	
}
