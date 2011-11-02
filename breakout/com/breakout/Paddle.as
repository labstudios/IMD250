package com.breakout
{
	import com.breakout.GameObject;
	
	public class Paddle extends GameObject
	{
		private static var PADDLE:Paddle;
		
		public function Paddle():void
		{
			PADDLE = this;
		}
		
		override public function run():void
		{
			this.x = Breakout.instance.mouseX;
			if (this.left < Breakout.LEFT)
			{
				this.left = Breakout.LEFT;
			}
			if (this.right > Breakout.RIGHT)
			{
				this.right = Breakout.RIGHT;
			}
		}
		
		public static function get instance():Paddle
		{
			return PADDLE;
		}
	}
}