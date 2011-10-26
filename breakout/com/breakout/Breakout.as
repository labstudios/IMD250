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
		
		public function Breakout():void
		{
			this.addEventListener(Event.ENTER_FRAME, run);
			this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
		}
		
		public function run(e:* = null):void
		{
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
	}
}