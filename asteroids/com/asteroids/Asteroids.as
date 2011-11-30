package com.asteroids
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import com.Master;
	
	public class Asteroids extends Sprite
	{
		public static const UP:int = 38;
		public static const DOWN:int = 40;
		public static const LEFT:int = 37;
		public static const RIGHT:int = 39;
		public static const SPACE:int = 32;
		public static const COLORS:Array = new Array(0x009900,
													0xFFEE07,
													0x0A3AC6,
													0xB11111,
													0x7D11B1,
													0xAAAAAA);
		
		private static var GAME:Asteroids;
		
		private var numRocks:int = 2;
		
		public function Asteroids():void
		{
			this.focusRect = false;
			GAME = this;
			Bullet.container = this.bullets_mc;
			Rock.container = this.rocks_mc;
			this.addEventListener(Event.ENTER_FRAME, run);
			this.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			this.addEventListener(KeyboardEvent.KEY_UP, keyReleased);
			this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:* = null):void
		{
			this.level = 1;
			this.lives = 2;
			this.score = 0;
			buildLevel();
		}
		
		private function buildLevel():void
		{
			Rock.rocks = new Vector.<Rock>();
			for (var i:int = 0; i < this.numRocks + this.level; ++i)
			{
				new LargeRock();
			}
		}
		
		private function nextLevel(e:* = null):void
		{
			this.level++;
			this.lives++;
			buildLevel();
		}
		
		private function keyPressed(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case UP:
					Ship.ship.upPressed = true;
				break;
				case DOWN:
					Ship.ship.downPressed = true;
				break;
				case LEFT:
					Ship.ship.leftPressed = true;
				break;
				case RIGHT:
					Ship.ship.rightPressed = true;
				break;
				case SPACE:
					Ship.ship.spacePressed = true;
				break;
				default:
					//ignore all other keys
				break;
			}
		}
		
		private function keyReleased(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case UP:
					Ship.ship.upPressed = false;
				break;
				case DOWN:
					Ship.ship.downPressed = false;
				break;
				case LEFT:
					Ship.ship.leftPressed = false;
				break;
				case RIGHT:
					Ship.ship.rightPressed = false;
				break;
				case SPACE:
					Ship.ship.spacePressed = false;
				break;
				default:
					//ignore all other keys
				break;
			}
		}
		
		private function run(e:* = null):void
		{
			stage.focus = this;
			Ship.ship.run();
			for (var i:int = 0; i < Bullet.bullets.length;++i)
			{
				Bullet.bullets[i].run();
			}
			for (i = 0; i < Rock.rocks.length;++i)
			{
				Rock.rocks[i].run();
			}
			if (Rock.rocks.length == 0 && this.lives > 0)
			{
				this.nextLevel();
			}
		}
		
		public function shipHit()
		{
			this.lives--;
			if (this.lives <= 0)
			{
				(parent as Master).navToEnd();
			}
		}
		
		private function killMe(e:* = null):void
		{
			this.removeEventListener(Event.ENTER_FRAME, run);
			this.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			this.removeEventListener(KeyboardEvent.KEY_UP, keyReleased);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, killMe);
		}
		
		public static function get game():Asteroids
		{
			return GAME;
		}
		
		public function get level():int
		{
			return int(level_txt.text);
		}
		
		public function set level(n:int):void
		{
			level_txt.text = n.toString();
		}
		
		public function get lives():int
		{
			return int(lives_txt.text);
		}
		
		public function set lives(n:int):void
		{
			lives_txt.text = n.toString();
		}
		
		public function get score():int
		{
			return int(score_txt.text);
		}
		
		public function set score(n:int):void
		{
			score_txt.text = n.toString();
		}
	}
}