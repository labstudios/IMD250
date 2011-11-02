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
		
		private var brickColumns:int = 10;
		private var brickRows:int = 2;
		private var xGap:Number = 42.5;
		private var yGap:Number = 17;
		private var startX:Number = 1;
		private var startY:Number = 40;
		
		public function Breakout():void
		{
			BREAKOUT = this;
			this.addEventListener(Event.ENTER_FRAME, run);
			this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
			Brick.CONTAINER = this;
			this.buildLevel();
		}
		
		private function buildLevel():void
		{
			var xloc:Number = this.startX;
			var yloc:Number = this.startY;
			
			for (var i:int = 0; i < this.brickRows; ++i)
			{
				for (var j:int = 0; j < this.brickColumns; ++j)
				{
					new Brick(xloc, yloc);
					xloc += this.xGap;
				}
				yloc += this.yGap;
				xloc = this.startX;
			}
		}
		
		public function run(e:* = null):void
		{
			Paddle.instance.run();
			ball.run();
			for (var i:int = 0; i < Brick.bricks.length;++i)
			{
				Brick.bricks[i].run();
			}
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