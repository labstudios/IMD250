package com.breakout
{
	import com.breakout.GameObject;
	import com.breakout.Breakout;
	
	public class Ball extends GameObject
	{
		private var angle:Number = 225;
		private var speed:Number = 5;
		private var angleChange:Number = 10;
		
		public function Ball():void
		{
			
		}
		
		override public function run():void
		{
			if (this.nextLeft < Breakout.LEFT)
			{
				this.left = Breakout.LEFT;
				this.vx *= -1;
				adjustAngle();
			}
			if (this.nextTop < Breakout.TOP)
			{
				this.top = Breakout.TOP;
				this.vy *= -1;
				adjustAngle();
			}
			if (this.nextRight > Breakout.RIGHT)
			{
				this.right = Breakout.RIGHT;
				this.vx *= -1;
				adjustAngle();
			}
			if (this.nextBottom > Breakout.BOTTOM)
			{
				this.bottom = Breakout.BOTTOM;
				this.vy *= -1;
				adjustAngle();
			}
			
			this.vx = Math.cos(this.rads) * speed;
			this.vy = Math.sin(this.rads) * speed;
			var nextX = this.x + this.vx;
			var nextY = this.y + this.vy;
			
			this.x = nextX;
			this.y = nextY;
		}
		
		public function adjustAngle():void
		{
			this.angle = Math.atan2(this.vy, this.vx) * 180 / Math.PI;
			this.angle += this.angleMod;
		}
		
		public function get rads():Number
		{
			return angle * Math.PI / 180;
		}
		
		public function get angleMod():Number
		{
			return Math.random() * (this.vy < 0 ? angleChange: -angleChange);
		}
	}
}