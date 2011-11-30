package com.asteroids
{
	
	public class SmallRock extends Rock
	{
		
		public function SmallRock():void
		{
			this.rockMinSpeed = 3;
			this.rockMaxSpeed = 5;
			this.speed = (Math.random() * (this.rockMaxSpeed - this.rockMinSpeed)) + this.rockMinSpeed;
			this.pointValue = 100;
		}
		
		override public function hitMe(awardPoints:Boolean = true):void
		{
			super.hitMe(awardPoints);
		}
	}
}