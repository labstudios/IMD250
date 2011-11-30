package com.asteroids
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import com.greensock.*;
	
	public class Rock extends GameObject
	{
		public static var rocks:Vector.<Rock> = new Vector.<Rock>();
		public static var container:DisplayObjectContainer;
		protected var rockMinSpeed:Number = 1;
		protected var rockMaxSpeed:Number = 2;
		protected var pointValue:int = 0;
		
		private var rot:Number = 0;
		
		public function Rock():void
		{
			if (container != null)
			{
				rocks.push(this);
				container.addChild(this);
				this.rotation = Math.random() * 360;
				this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
				TweenMax.to(this, 0, { colorTransform: { tint:Asteroids.COLORS[(Asteroids.game.level - 1) % Asteroids.COLORS.length], tintAmount:0.5 }} );
			}
		}
		
		override public function run():void
		{
			if (this.hitTestObject(Ship.ship.hitSpot))
			{
				Ship.ship.killShip(this);
			}
			super.run();
		}
		
		public function hitMe(awardPoints:Boolean = true):void
		{
			if (awardPoints)
			{
				Asteroids.game.score += this.pointValue;
			}
			removeMe();
		}
		
		public function removeMe(e:* = null):void
		{
			container.removeChild(this);
		}
		
		private function killMe(e:* = null):void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, killMe);
			for (var i:int = 0; i < rocks.length;++i)
			{
				if (this == rocks[i])
				{
					rocks.splice(i, 1);
					break;
				}
			}
		}
		
		override public function get rotation():Number
		{
			return this.rot;
		}
		
		override public function set rotation(r:Number):void
		{
			this.rot = r;
		}
	}
}