package com.asteroids
{
	
	public class MediumRock extends Rock
	{
		private var numSmall:int = 3;
		
		public function MediumRock():void
		{
			this.rockMinSpeed = 2;
			this.rockMaxSpeed = 4;
			this.speed = (Math.random() * (this.rockMaxSpeed - this.rockMinSpeed)) + this.rockMinSpeed;
			this.pointValue = 50;
		}
		
		override public function hitMe(awardPoints:Boolean = true):void
		{
			for (var i:int = 0; i < this.numSmall;++i)
			{
				var rock:SmallRock = new SmallRock();
				rock.x = this.x;
				rock.y = this.y;
			}
			super.hitMe(awardPoints);
		}
	}
}