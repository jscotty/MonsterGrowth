package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent
	import flash.text.TextField;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author Justin Bieshaar
	 */
	public class Menu extends Sprite
	{
		private var _playText:TextField;
		private var _credits:TextField;
		private var _how:TextField;
		
		private var _back:TextField;
		private var _back2:TextField;
		
		private var _game:TextField;
		private var _controll:TextField;
		
		private var _gameRules:MovieClip;
		private var _howTo:MovieClip;
		
		private var _fullScreen:TextField;
		
		private var _mediaCollege:TextField;
		
		private var _s:Stage;
		
		private var _background:MovieClip;
		private var _creditsText:MovieClip;
		
		public var soundPlay:Sound;
		public var soundChannel:SoundChannel;
		
		public function Menu(s:Stage) 
		{
			soundChannel = new SoundChannel;
			soundPlay = new Sound;
			soundPlay.load(new URLRequest("title_screen.mp3"));
			soundPlay.addEventListener(Event.COMPLETE, onComplete, false);
			
			
			_background = new StartBg;
			_background.x = 0;
			_background.y = 0;
			_background.width = s.stageWidth;
			_background.height = s.stageHeight; 
			addChild(_background);
			_background.visible = true;
			
			_howTo = new HowToPlay;
			_howTo.width = s.stageWidth;
			_howTo.height = s.stageHeight; 
			addChild(_howTo);
			_howTo.visible = false;
			
			_gameRules = new GameRules;
			_gameRules.width = s.stageWidth;
			_gameRules.height = s.stageHeight; 
			addChild(_gameRules);
			_gameRules.visible = false;
			
		
			_s = s;
			_s.addEventListener(MouseEvent.CLICK, onClick); 
			
			_creditsText = new CreditsText; 
			_creditsText.x = 300; 
			_creditsText.y = 630; 
			_creditsText.scaleX = 0.4;
			_creditsText.scaleY = 0.4;
			addChild(_creditsText); 
			_creditsText.visible = false;
			
			var tf:TextFormat = new TextFormat("Papyrus", 82, 0xFFFFFFFF,true); // variable voor de text style.
			_playText = new TextField();
			_playText.text = "Play";
			_playText.y = 640; // text positie y
			_playText.x = s.stageWidth / 2.5; // text positie x
			addChild(_playText);
			_playText.selectable = false;
			_playText.width = _playText.textWidth + 300; // maximale grootte text
			_playText.setTextFormat(tf);
			_playText.visible = true;
			
			tf = new TextFormat("Papyrus", 12, 0xFFFFFFFF, true); // variable voor de text style
			_mediaCollege = new TextField();
			_mediaCollege.text = "Students Media College Amsterdam";
			_mediaCollege.y = 10;
			_mediaCollege.x = 650;
			addChild(_mediaCollege);
			_mediaCollege.selectable = false;
			_mediaCollege.width = _mediaCollege.textWidth + 400;
			_mediaCollege.setTextFormat(tf);
			
			
			tf = new TextFormat("Papyrus", 25, 0xFFFFFFFF, true); // variable voor de text style.
			_credits = new TextField();
			_credits.text = "Credits";
			_credits.y = 760; // text positie y
			_credits.x = 20; // text positie x
			addChild(_credits);
			_credits.selectable = false;
			_credits.width = _credits.textWidth + 160; // maximale grootte text
			_credits.setTextFormat(tf);
			_credits.visible = true;
			
			tf = new TextFormat("Papyrus", 25, 0xFFFFFFFF, true); // variable voor de text style.
			_how = new TextField();
			_how.text = "How to Play?";
			_how.y = 800; // text positie y
			_how.x = 20; // text positie x
			addChild(_how);
			_how.selectable = false;
			_how.width = _how.textWidth + 200; // maximale grootte text
			_how.setTextFormat(tf);
			_how.visible = true;
			
			tf = new TextFormat("Papyrus", 45, 0xFFFFFFFF, true); // variable voor de text style.
			_controll = new TextField();
			_controll.text = "Controll";
			_controll.y = 700; // text positie y
			_controll.x = 200; // text positie x
			addChild(_controll);
			_controll.selectable = false;
			_controll.width = _controll.textWidth + 150; // maximale grootte text
			_controll.setTextFormat(tf);
			_controll.visible = false;
			
			_game = new TextField();
			_game.text = "Game Rules";
			_game.y = 700; // text positie y
			_game.x = 500; // text positie x
			addChild(_game);
			_game.selectable = false;
			_game.width = _game.textWidth + 200; // maximale grootte text
			_game.setTextFormat(tf);
			_game.visible = false;
			
			tf = new TextFormat("Papyrus", 35, 0xFFFFFFFF, true); // variable voor de text style.
			_back = new TextField();
			_back.text = "< Back";
			_back.y = 800; // text positie y
			_back.x = 20; // text positie x
			addChild(_back);
			_back.selectable = false;
			_back.width = _back.textWidth + 200; // maximale grootte text
			_back.setTextFormat(tf);
			_back.visible = false;
			
			_back2 = new TextField();
			_back2.text = "< Back";
			_back2.y = 800; // text positie y
			_back2.x = 20; // text positie x
			addChild(_back2);
			_back2.selectable = false;
			_back2.width = _back2.textWidth + 200; // maximale grootte text
			_back2.setTextFormat(tf);
			_back2.visible = false;
			
			/*_fullScreen = new TextField();
			_fullScreen.text = "Fullscreen";
			_fullScreen.y = 800; // text positie y
			_fullScreen.x = 300; // text positie x
			addChild(_fullScreen);
			_fullScreen.selectable = false;
			_fullScreen.width = _fullScreen.textWidth + 200; // maximale grootte text
			_fullScreen.setTextFormat(tf);
			_fullScreen.visible = true;*/
			
			
			addEventListener(MouseEvent.MOUSE_OUT, onOut, false, 0, true);
			addEventListener(MouseEvent.MOUSE_OVER, onHoover, false, 0, true);
		}
			
////////////////////////////////////////////////////////////// Click functie //////////////////////////////////////////////////////////////

		private function onClick(e:MouseEvent):void 
		{
			//// Play Text ////
			if (e.target == _playText ) {
				dispatchEvent(new Event("startGame")); // als er op Play geklickt word, word de game gestart
				soundChannel.stop();
			}
			
			//// Credits! ////
			else if (e.target == _credits)
			{
				_how.visible = false;
				_playText.visible = false;
				_credits.visible = false;
				_back.visible = true;
				_creditsText.visible = true;
				_background.visible = true;
				_gameRules.visible = false;
				_howTo.visible = false;
				_back2.visible = false;
			}
			
			//// How to Play ////
			else if (e.target == _how)
			{
				_playText.visible = false;
				_credits.visible = false;
				_how.visible = false;
				_creditsText.visible = false;
				_back.visible = true;
				_controll.visible = true;
				_game.visible = true;
				_gameRules.visible = false;
				_howTo.visible = false;
				_back2.visible = false;
				
			}
			else if (e.target == _controll)
			{
				_playText.visible = false;
				_credits.visible = false;
				_how.visible = false;
				_creditsText.visible = false;
				_back.visible = false;
				_controll.visible = false;
				_game.visible = false;
				_gameRules.visible = false;
				_howTo.visible = true;
				_back2.visible = true;
				
			}
			else if (e.target == _game)
			{
				_playText.visible = false;
				_credits.visible = false;
				_how.visible = false;
				_creditsText.visible = false;
				_back.visible = false;
				_controll.visible = false;
				_game.visible = false;
				_gameRules.visible = true;
				_howTo.visible = false;
				_back2.visible = true;
				
			}
			
			//// Back Button ////
			else if (e.target == _back)
			{
				_background.visible = true;
				_playText.visible = true;
				_credits.visible = true;
				_how.visible = true;
				_back.visible = false;
				_creditsText.visible = false;
				_controll.visible = false;
				_game.visible = false;
				_gameRules.visible = false;
				_howTo.visible = false;
				_back2.visible = false;
				
			}
			else if (e.target == _back2)
			{
				_playText.visible = false;
				_credits.visible = false;
				_how.visible = false;
				_creditsText.visible = false;
				_back.visible = true;
				_controll.visible = true;
				_game.visible = true;
				_gameRules.visible = false;
				_howTo.visible = false;
				_back2.visible = false;
				
			}
		}
		
////////////////////////////////////////////////////////////// onHoover / onOut //////////////////////////////////////////////////////////////

		private function onHoover(e:MouseEvent):void
		{
			if (e.target == _back)
			{
				_back.alpha = 0.7;
			}
			else if (e.target == _back2)
			{
				_back2.alpha = 0.7;
			}
			else if (e.target == _game)
			{
				_game.alpha = 0.7;
			}
			else if (e.target == _controll)
			{
				_controll.alpha = 0.7;
			}
			else if (e.target == _how)
			{
				_how.alpha = 0.7;
			}
			else if (e.target == _playText)
			{
				_playText.alpha = 0.7;
			}
			else if (e.target == _credits)
			{
				_credits.alpha = 0.7;
			}
			
		} 
		private function onOut(e:MouseEvent):void
		{
			if (e.target == _back)
			{
				_back.alpha = 1;
			}
			else if (e.target == _back2)
			{
				_back2.alpha = 1;
			}
			else if (e.target == _game)
			{
				_game.alpha = 1;
			}
			else if (e.target == _controll)
			{
				_controll.alpha = 1;
			}
			else if (e.target == _how)
			{
				_how.alpha = 1;
			}
			else if (e.target == _playText)
			{
				_playText.alpha = 1;
			}
			else if (e.target == _credits)
			{
				_credits.alpha = 1;
			}
			
		}

////////////////////////////////////////////////////////////// Sound //////////////////////////////////////////////////////////////

		private function onComplete(e:Event):void
			{
				soundChannel = soundPlay.play(0,999999);
			}
			
			
////////////////////////////////////////////////////////////// Destroy Menu //////////////////////////////////////////////////////////////
		public function destroy():void // Stopt het menu
		{
			trace("Kaput");
			_playText = null;
			_s.addEventListener(MouseEvent.CLICK, onClick);
			
		}
		
///////////////////////////////////////// FullScreen ////////////////////////////////

		public function fullScreen(e:MouseEvent):void
		{
			/*trace("FULLSCREEN");
			stage.fullScreenSourceRect = new Rectangle(0, 0, 900, 850);
			stage.displayState = StageDisplayState.FULL_SCREEN;*/
		}
	}

}