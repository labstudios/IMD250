package com
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import com.FrameListener;
	
	public class Master extends MovieClip
	{
		public static const LANDING:String = "landing";
		public static const INSTRUCTIONS:String = "instructions";
		public static const GAME:String = "game";
		public static const END:String = "end";
		private var timer:Timer = new Timer(500);
		protected var fListener:FrameListener;
		
		public function Master():void
		{
			stop();
			timer.addEventListener(TimerEvent.TIMER, checkLoad);
			timer.start();
			fListener = new FrameListener(this);
			fListener.addListener(LANDING, buildLanding);
			fListener.addListener(INSTRUCTIONS, buildInst);
			fListener.addListener(GAME, buildGame);
			fListener.addListener(END, buildEnd);
		}
		
		private function checkLoad(e:* = null):void
		{
			var perc:Number = this.loaderInfo.bytesLoaded / this.loaderInfo.bytesTotal;
			if (perc >= 1)
			{
				timer.stop();
				ready();
			}
			else
			{
				loader(perc);
			}
			
		}
		
		public function loader(n:Number):void
		{
			//polymorphism
		}
		
		public function ready():void
		{
			navToLanding();
		}
		
		//Builder Functions
		protected function buildLanding(e:* = null):void
		{
			playBtn.addEventListener(MouseEvent.CLICK, navToGame);
			instBtn.addEventListener(MouseEvent.CLICK, navToInst);
		}
		
		protected function buildInst(e:* = null):void
		{
			playBtn.addEventListener(MouseEvent.CLICK, navToGame);
			backBtn.addEventListener(MouseEvent.CLICK, navToLanding);
		}
		
		protected function buildGame(e:* = null):void
		{
			endBtn.addEventListener(MouseEvent.CLICK, navToEnd);
		}
		
		protected function buildEnd(e:* = null):void
		{
			restartBtn.addEventListener(MouseEvent.CLICK, navToLanding);
		}
		
		//Navigation Functions
		
		public function navTo(loc:String):void
		{
			gotoAndStop(loc);
		}
		
		public function navToLanding(e: * = null):void
		{
			navTo(LANDING);
		}
		
		public function navToInst(e: * = null):void
		{
			navTo(INSTRUCTIONS);
		}
		
		public function navToGame(e: * = null):void
		{
			navTo(GAME);
		}
		
		public function navToEnd(e: * = null):void
		{
			navTo(END);
		}
		
		//getters and setters
		
		public function get playBtn():SimpleButton
		{
			return this["play_btn"] as SimpleButton;
		}
		
		public function get instBtn():SimpleButton
		{
			return this["inst_btn"] as SimpleButton;
		}
		
		public function get backBtn():SimpleButton
		{
			return this["back_btn"] as SimpleButton;
		}
		
		public function get endBtn():SimpleButton
		{
			return this["end_btn"] as SimpleButton;
		}
		
		public function get restartBtn():SimpleButton
		{
			return this["restart_btn"] as SimpleButton;
		}
	}
}