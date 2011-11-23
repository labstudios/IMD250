package com.asteroids
{
	
	public class SmallRock extends Rock
	{
		
		public function SmallRock():void
		{
			this.rockMinSpeed = 3;
			this.rockMaxSpeed = 5;
			this.speed = (Math.random() * (this.rockMaxSpeed - this.rockMinSpeed)) + this.rockMinSpeed;
		}
		
		override public function hitMe():void
		{
			super.hitMe();
		}
	}
}