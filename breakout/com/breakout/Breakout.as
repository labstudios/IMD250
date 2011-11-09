package com.breakout
{
	import flash.display.Sprite;
	import flash.events.Event;
	import fl.text.TLFTextField;
	import com.Game;

	public class Breakout extends Sprite
	{
		public static const TOP:Number = 0;
		public static const BOTTOM:Number = 400;
		public static const LEFT:Number = 0;
		public static const RIGHT:Number = 425;
		private static var BREAKOUT:Breakout;
		
		private var game:Game;
		private var brickColumns:int = 10;
		private var brickRows:int = 2;
		private var xGap:Number = 42.5;
		private var yGap:Number = 17;
		private var startX:Number = 1;
		private var startY:Number = 40;
		
		public function Breakout():void
		{
			BREAKOUT = this;
			this.game = Game.instance;
			this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
			this.addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:* = null):void
		{
			this.addEventListener(Event.ENTER_FRAME, run);
			Brick.CONTAINER = this;
			level = 1;
			lives = 3;
			points = 0;
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
			if (Brick.bricks.length == 0)
			{
				level++;
				brickRows++;
				buildLevel();
			}
		}
		
		public function deadBall():void
		{
			ball.resetPosition();
			lives--;
			if (lives <= 0)
			{
				Game.endGame();
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
		
		public function get level():int
		{
			var levelText:TLFTextField = this["level_txt"] as TLFTextField;
			return int(levelText.text);
		}
		
		public function set level(i:int):void
		{
			var levelText:TLFTextField = this["level_txt"] as TLFTextField;
			levelText.text = i.toString();
		}
		
		public function get lives():int
		{
			var lifeText:TLFTextField = this["lives_txt"] as TLFTextField;
			return int(lifeText.text);
		}
		
		public function set lives(i:int):void
		{
			var lifeText:TLFTextField = this["lives_txt"] as TLFTextField;
			lifeText.text = i.toString();
		}
		
		public function get points():int
		{
			var pointsText:TLFTextField = this["points_txt"] as TLFTextField;
			return int(pointsText.text);
		}
		
		public function set points(i:int):void
		{
			var pointsText:TLFTextField = this["points_txt"] as TLFTextField;
			pointsText.text = i.toString();
		}
	}
}