package com
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Ball extends MovieClip
	{
		//public static const SPEED:Number = 3.5;
		private var speed:Number = 1;
		public static var numBalls:int = 0;
		private var bounciness:int = 5;
		
		public function Ball():void
		{
			numBalls++;
			trace("there are " + numBalls.toString() + " balls available.");
			//trace(SPEED);
			
			//this.addEventListener(Event.ENTER_FRAME, run);
		}
		
		private function run(e:* = null):void
		{
			trace("running");
		}
		
		public function get bounce():Number
		{
			return this.bounciness;
		}
		
		public function set bounce(n:Number):void
		{
			this.bounciness = n;
			this.speed = n / 5;
		}
		
		override public function set x(n:Number):void
		{
			//trace("Sorry, I am not going to " + n.toString() + " :P");
			super.x = n;
			this.y = n;
		}
		
	}
}