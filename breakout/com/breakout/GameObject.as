package com.breakout
{
	import flash.display.MovieClip
	
	public class GameObject extends MovieClip
	{
		protected var vx:Number;
		protected var vy:Number;
		
		public function GameObject():void
		{
			
		}
		
		public function run():void
		{
			//polymorphosize
		}
		
		public function get left():Number
		{
			return this.x - (this.width / 2);
		}
		
		public function set left(n:Number):void
		{
			this.x = n + (this.width / 2);
		}
		
		public function get right():Number
		{
			return this.x + (this.width / 2);
		}
		
		public function set right(n:Number):void
		{
			this.x = n - (this.width / 2);
		}
		
		public function get top():Number
		{
			return this.y - (this.height / 2);
		}
		
		public function set top(n:Number):void
		{
			this.y = n + (this.height / 2);
		}
		
		public function get bottom():Number
		{
			return this.y + (this.height / 2);
		}
		
		public function set bottom(n:Number):void
		{
			this.y = n - (this.height / 2);
		}
		
		public function get nextLeft():Number
		{
			return (this.x + this.vx) - (this.width / 2);
		}
		
		public function get nextRight():Number
		{
			return (this.x + this.vx) + (this.width / 2);
		}
		
		public function get nextTop():Number
		{
			return (this.y + this.vy) - (this.height / 2);
		}
		
		public function get nextBottom():Number
		{
			return (this.y + this.vy) + (this.height / 2);
		}
	}
	
}