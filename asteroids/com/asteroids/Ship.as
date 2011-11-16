package com.asteroids
{
	
	
	public class Ship extends GameObject
	{
		private static var SHIP:Ship;
		
		private var _up:Boolean = false;
		private var _down:Boolean = false;
		private var _left:Boolean = false;
		private var _right:Boolean = false;
		private var _space:Boolean = false;
		
		private var rotateSpeed:Number = 8;
		private var acceleration:Number = .5;
		private var topSpeed:Number = 6;
		
		public function Ship():void
		{
			SHIP = this;
		}
		
		override public function run():void
		{
			this.rotation -= this._left ? this.rotateSpeed:0;
			this.rotation += this._right ? this.rotateSpeed:0;
			this._up ? accelerate():null;
			this._down ? decelerate():null;
			
			super.run();
		}
		
		public function accelerate():void
		{
			if (this.speed > this.topSpeed)
			{
				this.vx -= Math.cos(this.direction * Math.PI / 180) * this.acceleration;
				this.vy -= Math.sin(this.direction * Math.PI / 180) * this.acceleration;
			}
			this.vx += Math.cos(this.rotation * Math.PI / 180) * this.acceleration;
			this.vy += Math.sin(this.rotation * Math.PI / 180) * this.acceleration;
		}
		
		public function decelerate():void
		{
			if (this.speed > 0)
			{
				this.vx -= Math.cos(this.direction * Math.PI / 180) * this.acceleration / 2;
				this.vy -= Math.sin(this.direction * Math.PI / 180) * this.acceleration / 2;
			}
			if (this.speed < this.acceleration)
			{
				this.speed = 0;
			}
		}
		
		public static function get ship():Ship
		{
			return SHIP;
		}
		
		public function set upPressed(b:Boolean):void
		{
			this._up = b;
		}
		
		public function set downPressed(b:Boolean):void
		{
			this._down = b;
		}
		
		public function set leftPressed(b:Boolean):void
		{
			this._left = b;
		}
		
		public function set rightPressed(b:Boolean):void
		{
			this._right = b;
		}
		
		public function set spacePressed(b:Boolean):void
		{
			this._space = b;
		}
	}
}