package com.asteroids
{
	import com.greensock.*; 
	import com.greensock.easing.*;
	
	public class Ship extends GameObject
	{
		private static var SHIP:Ship;
		private static const SHOT_SPACE:int = 8;
		
		private var _up:Boolean = false;
		private var _down:Boolean = false;
		private var _left:Boolean = false;
		private var _right:Boolean = false;
		private var _space:Boolean = false;
		
		private var rotateSpeed:Number = 8;
		private var acceleration:Number = .5;
		private var topSpeed:Number = 6;
		private var shotSpacer:int = 0;
		
		private var startX;
		private var startY;
		private var invincible:Boolean = false;
		private var invincibleColor:Number = 0xff0000;
		
		public function Ship():void
		{
			SHIP = this;
			this.startX = this.x;
			this.startY = this.y;
			this.hitSpot.alpha = 0;
		}
		
		override public function run():void
		{
			this.rotation -= this._left ? this.rotateSpeed:0;
			this.rotation += this._right ? this.rotateSpeed:0;
			this._up ? accelerate():null;
			this._down ? decelerate():null;
			if (this._space)
			{
				if (this.shotSpacer <= 0)
				{
					new Bullet(this.x, this.y, this.rotation);
					this.shotSpacer = SHOT_SPACE;
				}
				else
				{
					this.shotSpacer--;
				}
			}
			else
			{
				this.shotSpacer = 0;
			}
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
		
		public function killShip(rock:Rock = null):void
		{
			if (!this.invincible)
			{
				this.invincible = true;
				this.x = this.startX;
				this.y = this.startY;
				this.speed = 0;
				Asteroids.game.shipHit();
				TweenMax.to(this, 0, { colorTransform: { tint:this.invincibleColor, tintAmount:0.5 }} );
				TweenMax.to(this, 3, { colorTransform: { tint:this.invincibleColor, tintAmount:0 }, onComplete:this.mortal} );
			}
			if (rock != null)
			{
				rock.hitMe(false);
			}
		}
		
		private function mortal():void
		{
			this.invincible = false;
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