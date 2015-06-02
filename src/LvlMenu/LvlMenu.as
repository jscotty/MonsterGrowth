package LvlMenu 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class LvlMenu extends Sprite
	{
		private var _game:Game;
		
		private var _mediaCollege:TextField;
		private var _playHereText:TextField;
		private var _score:TextField;
		
		private var _background:BackgroundLvl;
		
		public var level:Number = Main.level;
		
		private var _counter:Number = 140;
		public var counterBool:Boolean = false;
		
		public function LvlMenu(stage:Stage) 
		{
			
			_background = new BackgroundLvl;
			_background.width = stage.stageWidth;
			_background.height = stage.stageHeight;
			addChild(_background);
			
			var tf:TextFormat = new TextFormat("Papyrus", 12, 0xFFFFFFFF, true); // variable voor de text style
			_mediaCollege = new TextField();
			_mediaCollege.text = "Students Media College Amsterdam";
			_mediaCollege.y = 10;
			_mediaCollege.x = 650;
			addChild(_mediaCollege);
			_mediaCollege.selectable = false;
			_mediaCollege.width = _mediaCollege.textWidth + 1000;
			_mediaCollege.setTextFormat(tf);
			
			tf = new TextFormat("Papyrus", 40, 0xFFFFFFFFF, true);
			_playHereText = new TextField();
			_playHereText.text = "Click here to play";
			_playHereText.width = _playHereText.textWidth + 400;
			_playHereText.x = stage.stageWidth / 3.25;
			_playHereText.y = 650;
			addChild(_playHereText);
			_playHereText.selectable = false;
			_playHereText.setTextFormat(tf);
			
			addEventListener(MouseEvent.CLICK, onClick);
			addEventListener(MouseEvent.MOUSE_OVER, onHoover);
			addEventListener(MouseEvent.MOUSE_OUT, onOut);
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
//////////////////////// Mouse Events! //////////////////////////////////
		public function onClick(e:Event):void
		{
			if (e.target == _playHereText)
			{
				dispatchEvent(new Event("startGame"));
				trace(level);
			}
		}
		
		private function onHoover(e:MouseEvent):void
		{
			if (e.target == _playHereText)
			{
				_playHereText.alpha = 0.7;
			}
		}
		
		private function onOut(e:MouseEvent):void
		{
			if (e.target == _playHereText)
			{
				_playHereText.alpha = 1;
			}
		}
		
////////////////////////// Loop //////////////////////////////////

		private function loop(e:Event):void
		{
			/*
			if (counterBool = true) 
			{
				_counter -= 1;
				trace(_counter);
			}
			else
			{
				
			}*/
			
		}
		
	}

}