package com.asteroids
{
	
	public class LargeRock extends Rock
	{
		private var numMed:int = 2;
		
		public function LargeRock():void
		{
			this.rockMinSpeed = 1;
			this.rockMaxSpeed = 2;
			this.speed = (Math.random() * (this.rockMaxSpeed - this.rockMinSpeed)) + this.rockMinSpeed;
		}
		
		override public function hitMe():void
		{
			for (var i:int = 0; i < this.numMed;++i)
			{
				var rock:MediumRock = new MediumRock();
				rock.x = this.x;
				rock.y = this.y;
			}
			super.hitMe();
		}
	}
}