package com
{
	import com.Master;
	import com.breakout.Breakout;
	
	public class Game extends Master
	{
		private static var GAME:Game;
		private var points:int = 0;
		
		public function Game():void
		{
			GAME = this;
		}
		
		public static function get instance():Game
		{
			return GAME;
		}
		
		override protected function buildEnd(e:* = null):void
		{
			super.buildEnd();
			points_txt.text = this.points.toString();
		}
		
		public static function endGame():void
		{
			instance.navToEnd();
		}
		
		override public function navToEnd(e: * = null):void
		{
			if (this.currentFrameLabel == Master.GAME)
			{
				this.points = Breakout.instance.points;
			}
			super.navToEnd();
		}
	}
}