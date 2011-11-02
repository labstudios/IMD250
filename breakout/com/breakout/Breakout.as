package com.breakout
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class Breakout extends Sprite
	{
		public static const TOP:Number = 0;
		public static const BOTTOM:Number = 400;
		public static const LEFT:Number = 0;
		public static const RIGHT:Number = 425;
		private static var BREAKOUT:Breakout;
		
		public function Breakout():void
		{
			BREAKOUT = this;
			this.addEventListener(Event.ENTER_FRAME, run);
			this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
		}
		
		public function run(e:* = null):void
		{
			Paddle.instance.run();
			ball.run();
		}
		
		private function killMe(e:* = null):void
		{
			this.removeEventListener(Event.ENTER_FRAME, run);
		}
		
		public function get ball():Ball
		{
			return this["ball_mc"] as Ball;
		}
		
		public static function get instance():Breakout
		{
			return BREAKOUT;
		}
	}
}