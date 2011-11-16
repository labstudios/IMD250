package com.asteroids
{
	import flash.display.MovieClip
	
	public class GameObject extends MovieClip
	{
		private static const TOP_WALL:Number = 0;
		private static const BOTTOM_WALL:Number = 400;
		private static const LEFT_WALL:Number = 0;
		private static const RIGHT_WALL:Number = 550;
		
		protected var vx:Number = 0;
		protected var vy:Number = 0;
		
		public function GameObject():void
		{
			
		}
		
		public function run():void
		{
			this.x += this.vx;
			this.y += this.vy;
			
			this.x = this.x < LEFT_WALL ? RIGHT_WALL:this.x;
			this.x = this.x > RIGHT_WALL ? LEFT_WALL:this.x;
			this.y = this.y < TOP_WALL ? BOTTOM_WALL:this.y;
			this.y = this.y > BOTTOM_WALL ? TOP_WALL:this.y;
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
		
		protected function get speed():Number
		{
			var asq:Number = this.vx * this.vx;
			var bsq:Number = this.vy * this.vy;
			var csq:Number = asq + bsq;
			return Math.sqrt(csq);
		}
		
		protected function set speed(n:Number):void
		{
			this.vx = Math.cos(this.rotation * Math.PI / 180) * n;
			this.vy = Math.sin(this.rotation * Math.PI / 180) * n;
		}
		
		protected function get direction():Number
		{
			return Math.atan2(this.vy, this.vx) * 180 / Math.PI;
		}
	}
	
}