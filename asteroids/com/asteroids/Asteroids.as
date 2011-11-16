package com.asteroids
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Asteroids extends Sprite
	{
		public static const UP:int = 38;
		public static const DOWN:int = 40;
		public static const LEFT:int = 37;
		public static const RIGHT:int = 39;
		public static const SPACE:int = 32;
		
		
		
		public function Asteroids():void
		{
			this.focusRect = false;
			this.addEventListener(Event.ENTER_FRAME, run);
			this.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			this.addEventListener(KeyboardEvent.KEY_UP, keyReleased);
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
		}
	}
}