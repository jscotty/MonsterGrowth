package 
{
	import Enemy.Enemys;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import LvlMenu.LvlMenu;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Main extends Sprite 
	{
		public static var _stage:Stage;
		public var mainmenu:Menu;
		public var lvlMenu:LvlMenu;
		private var _game:Game;
		private var _enemy:Enemys;
		private var _mask:MovieClip;
		
		public var score:int = Game.speedBar;
		
		public static var level:Number = 1;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
//////////////////////////////////////////////////////// START ////////////////////////////////////////////////////////

		public function start(e:Event):void 
		{
			//trace("start");
			mainmenu.visible = false;
			lvlMenu.visible = false;
			mainmenu.removeEventListener("startGame", start);
		//	removeChild(mainmenu);	
			_game = new Game(stage);
			_enemy = new Enemys();
			addChild(_game);
			_game.addEventListener("openMenu", menuOpen);
			_game.addEventListener("playerDeath", death);
			_game.addEventListener("finished", finish);
			_game.addEventListener("complete", complete)
			_mask.visible = true;
			
			
		}
		
//////////////////////////////////////////////////////// INIT ////////////////////////////////////////////////////////

		public function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_stage = stage;
			
			_mask = new Mask;
			_mask.y = 0;
			_mask.x = 0;
			addChild(_mask);
			_mask.visible = true;
			
			mainmenu = new Menu(stage);
			addChild(mainmenu);
			mainmenu.addEventListener("startGame", start);
			lvlMenu = new LvlMenu(stage);
			addChild(lvlMenu);
			lvlMenu.visible = false;
			
		}
		
//////////////////////////////////////////////////////// MenuOpen! ////////////////////////////////////////////////////////

		public function menuOpen(e:Event):void
		{
			mainmenu = new Menu(stage);
			addChildAt(mainmenu, this.numChildren);
			mainmenu.addEventListener("startGame", resume);
			mainmenu.visible = true;
			lvlMenu.visible = false;
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, _game.keyDown);
			for each (var enemy:Enemys in _game._enemy) 
			{
				enemy.visible = false;
			}
			_mask.visible = true;
		}
		
//////////////////////////////////////////////////////// Death! ////////////////////////////////////////////////////////

		public function death(e:Event):void
		{
			
			mainmenu.visible = true;
			lvlMenu.visible = false;
			removeChild(_game);
			_game = null;
			mainmenu.addEventListener("startGame", start);
			level = 1;
			//trace("klaar");
			_mask.visible = true;
		}
		
//////////////////////////////////////////////////////// Finish!! ////////////////////////////////////////////////////////

		public function finish(e:Event):void
		{
			lvlMenu.visible = true;
			removeChild(_game);
			_game = null;
			
			score += Game.speedBar;
			//trace(Game.speedBar);
			
			lvlMenu.addEventListener("startGame", start);
			level += 1;
			
			_mask.visible = true;
			
			//trace("klaar");
		}
		
//////////////////////////////////////////////////////// Complete!! ////////////////////////////////////////////////////////

		private function complete(e:Event):void
			{
				lvlMenu.visible = true;
				
				_game = null;
				removeChild(_game);
				
				
				lvlMenu.addEventListener("startGame", start);
				level += 1;
				
				_mask.visible = true;
				
				//trace("klaar");
			}

//////////////////////////////////////////////////////// RESUME! ////////////////////////////////////////////////////////
		
		public function resume(e:Event):void {
			//trace("resume");
			
			_game.gamePaused = false;
			_game.soundPlay.play();
			_game.startCount.start();
			
			mainmenu.visible = false;
			lvlMenu.visible = false;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, _game.keyDown);
			for each (var enemy:Enemys in _game._enemy) 
			{
				enemy.visible = true;
			}
			if (level == 2 || level == 3 || level == 4 || level == 5) // zonder dit werkte de dood functie niet. Vandaar tog maar zo.
			{
			_game.gamePaused = false;
			_game.soundPlay.play();
			_game.startCount.start();
			
			mainmenu.visible = false;
			lvlMenu.visible = false;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, _game.keyDown);
			for each (enemy in _game._enemy) 
			{
				enemy.visible = true;
			}
			}
			_mask.visible = true;
		
		}
		
	}
	
}