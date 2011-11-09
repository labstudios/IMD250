package com.breakout
{
	import com.breakout.GameObject;
	import flash.display.DisplayObjectContainer;
	
	public class Brick extends GameObject
	{
		public static var CONTAINER:DisplayObjectContainer;
		private static var BRICKS:Vector.<Brick> = new Vector.<Brick>();
		private static const POINT_WORTH:int = 10;
		private var beenHit:Boolean = false;
		private var gravity:Number = .1;
		
		public function Brick(startX:Number = 0, startY:Number = 0):void
		{
			if (CONTAINER)
			{
				CONTAINER.addChild(this);
				this.left = startX;
				this.top = startY;
				bricks.push(this);
				this.gravity = Math.random() * .5;
			}
		}
		
		override public function run():void
		{
			if (this.beenHit)
			{
				this.vy += this.gravity;
				this.y += this.vy;
				if (this.top > Breakout.BOTTOM)
				{
					this.killMe();
				}
			}
		}
		
		public function hit():void
		{
			Breakout.instance.points += this.beenHit ? POINT_WORTH / 2:POINT_WORTH;
			this.beenHit = true;
		}
		
		private function killMe():void
		{
			for (var i:int = 0; i < bricks.length; ++i)
			{
				if (this == bricks[i])
				{
					bricks.splice(i, 1);
					CONTAINER.removeChild(this);
					break;
				}
			}
		}
		
		public static function get bricks():Vector.<Brick>
		{
			return BRICKS;
		}
	}
}