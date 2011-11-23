package com.asteroids
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Bullet extends GameObject
	{
		public static var bullets:Vector.<Bullet> = new Vector.<Bullet>();
		public static var container:DisplayObjectContainer;
		private var bulletSpeed:Number = 15;
		private var bulletTime:int = 3; // in half seconds
		private var bulletTimer:Timer;
		
		public function Bullet(startX:Number = 0, startY:Number = 0, r:Number = 0):void
		{
			if (container != null)
			{
				bullets.push(this);
				this.x = startX;
				this.y = startY;
				this.rotation = r;
				this.speed = this.bulletSpeed;
				container.addChild(this);
				this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
				this.bulletTimer = new Timer(500, this.bulletTime);
				this.bulletTimer.addEventListener(TimerEvent.TIMER_COMPLETE, removeMe);
				this.bulletTimer.start();
			}
		}
		
		override public function run():void
		{
			super.run();
			for (var i:int = 0; i < Rock.rocks.length;++i)
			{
				if (Rock.rocks[i].hitTestObject(this))
				{
					Rock.rocks[i].hitMe();
					removeMe();
					break;
				}
			}
		}
		
		public function removeMe(e:* = null):void
		{
			this.bulletTimer.stop();
			this.bulletTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, removeMe);
			container.removeChild(this);
		}
		
		private function killMe(e:* = null):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, killMe);
			for (var i:int = 0; i < bullets.length;++i)
			{
				if (this == bullets[i])
				{
					bullets.splice(i, 1);
					break;
				}
			}
		}
	}
}