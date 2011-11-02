package com.breakout
{
	import com.breakout.GameObject;
	import com.breakout.Breakout;
	
	public class Ball extends GameObject
	{
		private var angle:Number = 225;
		private var speed:Number = 8;
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
			
			checkPaddle();
			checkBricks();
			
			this.vx = Math.cos(this.rads) * speed;
			this.vy = Math.sin(this.rads) * speed;
			var nextX = this.x + this.vx;
			var nextY = this.y + this.vy;
			
			this.x = nextX;
			this.y = nextY;
		}
		
		private function checkPaddle():void
		{
			if (this.bottom >= Paddle.instance.top &&
			this.top <= Paddle.instance.bottom &&
			this.left <= Paddle.instance.right &&
			this.right >= Paddle.instance.left)
			{
				if (this.y < Paddle.instance.y)
				{
					this.bottom = Paddle.instance.top;
				}
				else
				{
					this.top = Paddle.instance.bottom;
				}
				this.vy *= -1;
				adjustAngle();
			}
			
		}
		
		private function checkBricks():void
		{
			for (var i:int = 0; i < Brick.bricks.length; ++i)
			{
				var brick:Brick = Brick.bricks[i];
				//check the left side
				if (brick.hitTestPoint(this.left, this.y, true))
				{
					this.left = brick.right;
					this.vx *= -1;
					brick.hit();
					this.adjustAngle();
				}
				//check the right side
				if (brick.hitTestPoint(this.right, this.y, true))
				{
					this.right = brick.left;
					this.vx *= -1;
					brick.hit();
					this.adjustAngle();
				}
				//check the top
				if (brick.hitTestPoint(this.x, this.top, true))
				{
					this.top = brick.bottom;
					this.vy *= -1;
					brick.hit();
					this.adjustAngle();
				}
				//check the bottom
				if (brick.hitTestPoint(this.x, this.bottom, true))
				{
					this.bottom = brick.top;
					this.vy *= -1;
					brick.hit();
					this.adjustAngle();
				}
			}
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