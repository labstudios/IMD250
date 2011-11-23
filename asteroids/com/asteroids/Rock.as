package com.asteroids
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	public class Rock extends GameObject
	{
		public static var rocks:Vector.<Rock> = new Vector.<Rock>();
		public static var container:DisplayObjectContainer;
		protected var rockMinSpeed:Number = 1;
		protected var rockMaxSpeed:Number = 2;
		
		private var rot:Number = 0;
		
		public function Rock():void
		{
			if (container != null)
			{
				rocks.push(this);
				container.addChild(this);
				this.rotation = Math.random() * 360;
				this.addEventListener(Event.REMOVED_FROM_STAGE, killMe);
			}
		}
		
		public function hitMe():void
		{
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