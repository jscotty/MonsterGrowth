package  
{
	import Enemy.EnemyGull;
	import Enemy.EnemyHermitCrab;
	import Enemy.EnemyKwal;
	import Enemy.EnemyLevel3.EnemyBike;
	import Enemy.EnemyLevel3.EnemyCar;
	import Enemy.EnemyLevel3.EnemyTruck;
	import Enemy.EnemyLevel4.EnemyFighter;
	import Enemy.EnemyLevel4.EnemyHelicopter;
	import Enemy.EnemyLevel4.EnemyPlane;
	import Enemy.EnemyLevel5.EnemyPlanetOne;
	import Enemy.EnemyLevel5.EnemyPlanetThree;
	import Enemy.EnemyLevel5.EnemyPlanetTwo;
	import Enemy.EnemyLevel5.EnemySateliet;
	import Enemy.EnemyLevel5.EnemyUfo;
	import Enemy.Enemys;
	import Enemy.EnemyShrimp;
	import Enemy.EnemyTurtle;
	import Enemy.EnemyVis;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	import LvlMenu.LvlMenu;
	import Player.PlayerLevelBeach;
	import Player.PlayerLevelCity;
	import Player.PlayerLevelSky;
	import Player.PlayerLevelUnivers;
	import UI.Lifes;
	import utils.Vector2D;
	
	/**
	 * ...
	 * Astroid Game
	 * 
	 * Artist:
		 * Bart, Frederique, Romar, Lotte.
	 * Developers:
		 * Justin Bieshaar, Roushan Hausil.
	 * @author justin Bieshaar
	 */
	
	public class Game extends MovieClip
	{
		
		private var _main:Main;
		
		private var _player:MovieClip;
		
		private var _background:MovieClip;
		
		private var _enemyBackground:Array;
		public var _enemy:Array;
		private var _coolDown:int = 0;
		
		//lifes.
		private var _life1:Lifes;
		private var _life2:Lifes;
		private var _life3:Lifes;
		private var _timeAnim:int = 1;
		
		public var killed:int = 1;
		private var _killTimer:Timer;
		
		private var _facing:Number = 0; // voor de rotation.
		
		private var _counter:Number = 0;
		public var startCount:Timer;
		
		private var _startCountText:TextField;
		
		private var _levelText:TextField;
		private var tf:TextFormat;
		
		private var _finishText:TextField;
		private var tfFinish:TextFormat;
		
		private var _diedText:TextField;
		private var _diedTf:TextFormat;
		
		private var _speedBarTxt:TextField;
		private var _speedBarTf:TextFormat;
		
		private var _tfText:TextFormat;
		
		private var _backMenu:TextField;
		private var tfMenu:TextFormat;
		
		
		private var _velocity:Vector2D; // snelheid.
		private var _location:Vector2D; // locatie.
		private var _faceLocation:Vector2D; // Gezichts richting.
		
		public var gamePaused:Boolean = false;
		
		public static const openMenu:String = "openMenu";
		public static const playerDeath:String = "playerDeath";
		public static const finished:String = "finished";
		public static const complete:String = "complete";
		
		public var deathPlayer:Boolean = false;
		
		public var soundPlay:Sound;
		public var soundChannel:SoundChannel;
		
		public var eatSound:Sound;
		public var eatChannel:SoundChannel;
		
		private var _loseLifeSound:Sound;
		private var _loseLifeChannel:SoundChannel;
		
		private var _endScreenTxt:MovieClip;
		private var _moveTxt:int = 1;
		
		public static var speedBar:Number = 150;
		private var _speedBarSpeed:int = 0;
		private var _speedBarBool:Boolean = false;
		
		private var _animCounter:int = 0;
		
		private var _endScore:TextField;
		private var _endScoreTf:TextFormat;
		
		private var _winBool:Boolean = false;
		private var _winCount:int = 0;
		
		public var lvlMenu:LvlMenu;
		
		public function Game(stage:Stage) 
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp, false, 0, true);
			
			lvlMenu = new LvlMenu(stage);
			
			addEventListener(Event.ENTER_FRAME, loop, false, 0, true);
			addEventListener(TimerEvent.TIMER, startTimer, false, 0, true);
			
			
			_life1 = new Lifes;
			_life1.x = 30;
			_life1.y = 30;
			addChild(_life1);
			_life1.alpha = 0;
			
			_life2 = new Lifes;
			_life2.x = 70;
			_life2.y = 30;
			addChild(_life2);
			_life2.alpha = -0.5;
			
			_life3 = new Lifes;
			_life3.x = 110;
			_life3.y = 30;
			addChild(_life3);
			_life3.alpha = -1;
			
			soundChannel = new SoundChannel;
			soundPlay = new Sound;
			
			eatChannel = new SoundChannel;
			eatSound = new Sound;
			
			_loseLifeChannel = new SoundChannel;
			_loseLifeSound = new Sound;
			_loseLifeSound.load(new URLRequest("LoseLife.mp3"));
			
			
			
////////////////////////////////////////////////// LVL 1 !! //////////////////////////////////////////////////////////

		if (lvlMenu.level == 1)
		{
			soundPlay.load(new URLRequest("Soundtrack_seaa.mp3"));
			soundPlay.addEventListener(Event.COMPLETE, startMusic, false, 0, true);
			
			
			eatSound.load(new URLRequest("level_1_nom.mp3"));

			_background = new Background;

			_enemy = new Array;
			var newFish : EnemyVis;
			for (var i:int = 0; i < 3; i++) {
				newFish = new EnemyVis();
				_enemy.push(newFish);
				addChildAt(newFish, 1);
				newFish.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newFish.randomMovement = new Vector2D(1, 1);
				newFish.randomMovement.length = 1.2;
			}
			
			var newShrimp : EnemyShrimp;
			for ( i = 0; i < 3; i++) {
				newShrimp = new EnemyShrimp();
				_enemy.push(newShrimp);
				addChildAt(newShrimp, 1);
				newShrimp.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newShrimp.randomMovement = new Vector2D(1, 1);
				newShrimp.randomMovement.length = 2;
			}
			
			var newJelly : EnemyKwal;
			for ( i = 0; i < 3; i++) {
				newJelly = new EnemyKwal();
				_enemy.push(newJelly);
				addChildAt(newJelly, 1);
				newJelly.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newJelly.randomMovement = new Vector2D(1, 1);
				newJelly.randomMovement.length = 3.8;
			}
			
			
			_player = new Player; // geeft _player de waarde van de Player class.
			_player.scaleX = 0.8;
			_player.scaleY = 0.8;
			_player.animatieSpelen(0);
			
			_location = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
			_velocity = new Vector2D(1, 1);
			_velocity.length = 2.5;
			if (_counter > 100) {
			_velocity.length = 5;
			}
			
			startCount = new Timer(1000, 4);
			startCount.addEventListener(TimerEvent.TIMER, startTimer, false, 0, true);
			startCount.start();	
			
		}
//////////////////////////////////////// LEVEL 2!! /////////////////////////////////////////////////////////////
			else if (lvlMenu.level  == 2)
			{
			
			soundPlay.load(new URLRequest("Sand_backgournd_music.mp3"));
			soundPlay.addEventListener(Event.COMPLETE, startMusic, false, 0, true);
			
			eatSound.load(new URLRequest("level_2_nom.mp3"));
			
			_background = new BackgroundLevel2;
			
			
			_enemy = new Array;
			var newGull : EnemyGull;
			for ( i = 0; i < 3; i++) {
				newGull = new EnemyGull();
				_enemy.push(newGull);
				addChildAt(newGull, 1);
				newGull.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newGull.randomMovement = new Vector2D(1, 1);
				newGull.randomMovement.length = 3;
			}
			
			var newHermit : EnemyHermitCrab;
			for (i = 0; i < 3; i++) {
				newHermit = new EnemyHermitCrab();
				_enemy.push(newHermit);
				addChildAt(newHermit, 1);
				newHermit.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newHermit.randomMovement = new Vector2D(1, 1);
				newHermit.randomMovement.length = 2.6;
			}
			
			var newTurtle : EnemyTurtle;
			for ( i = 0; i < 3; i++) {
				newTurtle = new EnemyTurtle();
				_enemy.push(newTurtle);
				addChildAt(newTurtle, 1);
				newTurtle.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newTurtle.randomMovement = new Vector2D(1, 1);
				newTurtle.randomMovement.length = 4;
			}
			
			
			_player = new PlayerLevelBeach; // geeft _player de waarde van de Player class.
			_player.scaleX = 0.3;
			_player.scaleY = 0.3;
			
			
			_location = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
			_velocity = new Vector2D(1, 1);
			_velocity.length = 2.5;
			if (_counter > 100) {
			_velocity.length = 5;
			}
			
			startCount = new Timer(1000, 4);
			startCount.addEventListener(TimerEvent.TIMER, startTimer, false, 0, true);
			startCount.start();	
			
			}
			
///////////////////////////////////////////////////////////// LEVEL 3!! /////////////////////////////////////////////////////////

			else if (lvlMenu.level  == 3)
			{
			soundPlay.load(new URLRequest("CitySound.mp3"));
			soundPlay.addEventListener(Event.COMPLETE, startMusic, false, 0, true);
			
			eatSound.load(new URLRequest("level_3_nom.mp3"));
			
			_background = new BackgroundLvl3;
			
			
			_enemy = new Array;
			var newTruck : EnemyTruck;
			for (i = 0; i < 3; i++) {
				newTruck = new EnemyTruck();
				_enemy.push(newTruck);
				addChildAt(newTruck, 1);
				newTruck.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newTruck.randomMovement = new Vector2D(1, 1);
				newTruck.randomMovement.length = 5.2;
			}
			
			var newCar : EnemyCar;
			for ( i = 0; i < 3; i++) {
				newCar = new EnemyCar();
				_enemy.push(newCar);
				addChildAt(newCar, 1);
				newCar.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newCar.randomMovement = new Vector2D(1, 1);
				newCar.randomMovement.length = 10.8;
			}
			
			var newBike : EnemyBike;
			for ( i = 0; i < 3; i++) {
				newBike = new EnemyBike();
				_enemy.push(newBike);
				addChildAt(newBike, 1);
				newBike.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newBike.randomMovement = new Vector2D(1, 1);
				newBike.randomMovement.length = 12;
			}
			
			
			_player = new PlayerLevelCity; // geeft _player de waarde van de Player class.
			_player.scaleX = 0.4;
			_player.scaleY = 0.4;
			
			_location = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
			_velocity = new Vector2D(1, 1);
			_velocity.length = 2.5;
			if (_counter > 100) {
			_velocity.length = 5;
			}
			
			
			startCount = new Timer(1000, 4);
			startCount.addEventListener(TimerEvent.TIMER, startTimer, false, 0, true);
			startCount.start();	
			
			}
			
///////////////////////////////////////////////////////////// LEVEL 4!! ///////////////////////////////////////////////////////////

			else if (lvlMenu.level == 4)
			{
			soundPlay.load(new URLRequest("soundtrackAir.mp3"));
			soundPlay.addEventListener(Event.COMPLETE, startMusic, false, 0, true);
			
			eatSound.load(new URLRequest("level_4_nom.mp3"));
			
			_background = new BackgroundLvl4;

			_enemy = new Array;
			var newBoing : EnemyPlane;
			for (i = 0; i < 3; i++) {
				newBoing = new EnemyPlane();
				_enemy.push(newBoing);
				addChildAt(newBoing, 1);
				newBoing.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newBoing.randomMovement = new Vector2D(1, 1);
				newBoing.randomMovement.length = 5.2;
			}
			
			var newFighter : EnemyFighter;
			for ( i = 0; i < 3; i++) {
				newFighter = new EnemyFighter();
				_enemy.push(newFighter);
				addChildAt(newFighter, 1);
				newFighter.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newFighter.randomMovement = new Vector2D(1, 1);
				newFighter.randomMovement.length = 16.8;
			}
			
			var newHelicopter : EnemyHelicopter;
			for ( i = 0; i < 3; i++) {
				newHelicopter = new EnemyHelicopter();
				_enemy.push(newHelicopter );
				addChildAt(newHelicopter , 1);
				newHelicopter .enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newHelicopter .randomMovement = new Vector2D(1, 1);
				newHelicopter.randomMovement.length = 11.5;
			}
			
			
			_player = new PlayerLevelSky; // geeft _player de waarde van de Player class.
			_player.scaleX = 0.29;
			_player.scaleY = 0.29;
			_player.animatieSpelen(0);
			
			
			_location = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
			_velocity = new Vector2D(1, 1);
			_velocity.length = 2.5;
			if (_counter > 100) {
			_velocity.length = 5;
			}
			
			startCount = new Timer(1000, 4);
			startCount.addEventListener(TimerEvent.TIMER, startTimer, false, 0, true);
			startCount.start();
			}
			
/////////////////////////////////////////////////////// Level 5 !! ////////////////////////////////////////////////////////////////
			else if (lvlMenu.level == 5)
			{
			soundPlay.load(new URLRequest("spacelevel.mp3"));
			soundPlay.addEventListener(Event.COMPLETE, startMusic, false, 0, true);
			
			eatSound.load(new URLRequest("level_5_nom.mp3"));
			
			_background = new BackgroundLvl5;
			
			_enemy = new Array;
			var newPlanet3 : EnemyPlanetThree;
			for (i = 0; i < 1; i++) {
				newPlanet3 = new EnemyPlanetThree();
				_enemy.push(newPlanet3);
				addChildAt(newPlanet3, 1);
				newPlanet3.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newPlanet3.randomMovement = new Vector2D(1, 1);
				newPlanet3.randomMovement.length = 8.2;
			}
			
			var newPlanet2 : EnemyPlanetTwo;
			for (i = 0; i < 1; i++) {
				newPlanet2 = new EnemyPlanetTwo();
				_enemy.push(newPlanet2);
				addChildAt(newPlanet2, 1);
				newPlanet2.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newPlanet2.randomMovement = new Vector2D(1, 1);
				newPlanet2.randomMovement.length = 8.2;
			}
			
			var newPlanet1 : EnemyPlanetOne;
			for (i = 0; i < 1; i++) {
				newPlanet1 = new EnemyPlanetOne();
				_enemy.push(newPlanet1);
				addChildAt(newPlanet1, 1);
				newPlanet1.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newPlanet1.randomMovement = new Vector2D(1, 1);
				newPlanet1.randomMovement.length = 8.2;
			}
			
			var newUfo : EnemyUfo;
			for ( i = 0; i < 3; i++) {
				newUfo = new EnemyUfo();
				_enemy.push(newUfo);
				addChildAt(newUfo, 1);
				newUfo.enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newUfo.randomMovement = new Vector2D(1, 1);
				newUfo.randomMovement.length = 13.9;
			}
			
			var newSateliet : EnemySateliet;
			for ( i = 0; i < 3; i++) {
				newSateliet = new EnemySateliet();
				_enemy.push(newSateliet );
				addChildAt(newSateliet , 1);
				newSateliet .enemyLocation = new Vector2D(Math.floor (Math.random() * stage.stageWidth), Math.floor (Math.random() * stage.stageHeight));
				newSateliet .randomMovement = new Vector2D(1, 1);
				newSateliet.randomMovement.length = 22.5;
			}
			
			
			_player = new PlayerLevelUnivers; // geeft _player de waarde van de Player class.
			_player.scaleX = 0.4;
			_player.scaleY = 0.4;
			_player.animatieSpelen(0);
			
			
			
			_location = new Vector2D(stage.stageWidth / 2, stage.stageHeight / 2);
			_velocity = new Vector2D(1, 1);
			_velocity.length = 2.5;
			if (_counter > 100) {
			_velocity.length = 5;
			}	
			
			startCount = new Timer(1000, 4);
			startCount.addEventListener(TimerEvent.TIMER, startTimer, false, 0, true);
			startCount.start();
			}

////////////////////////////////////////////// END SCREEN ////////////////////////////////////

			else if (lvlMenu.level == 6)
			{
				_background = new EndScreenBG;
				
				var _endScoreTf:TextFormat = new TextFormat("papyrus", 35, 0xFFFFFFFF, true); // variable voor de text style.
				_endScore = new TextField();
				_endScore.text = "Total score: " + speedBar;
				_endScore.y = 20; // text positie y
				_endScore.x = 600; // text positie x
				addChild(_endScore);
				_endScore.width = _endScore.textWidth + 200; // maximale grootte text
				_endScore.height = 55;
				_endScore.selectable = false;
				_endScore.setTextFormat(_endScoreTf);
					
				_endScreenTxt = new EndScreenTxt;
				_endScreenTxt.x = 0;
				_endScreenTxt.y = 950;
				addChild(_endScreenTxt);
			}
			
			
			//////// Add player en lifes///////////
			if (lvlMenu.level == 1 || lvlMenu.level == 2 || lvlMenu.level == 3 || lvlMenu.level == 4 || lvlMenu.level == 5) {
				
			_player.x = stage.stageWidth / 2; // positioneerd de player in het midden van de stage.
			_player.y = stage.stageHeight / 2; // positioneed de player in het midde van de stage.
			addChild(_player); // gooit de player op het scherm.
			
			}
			
/////////////////////////// Texten //////////////////////////////
			
			_tfText = new TextFormat("Papyrus", 35, 0xFFFFFFFF, true);
			_levelText = new TextField;
			addChild(_levelText);
			_levelText.width = 900;
			_levelText.height = 1200;
			_levelText.x = 380;
			_levelText.y = 780;
			_levelText.text = "Level : " + lvlMenu.level;
			_levelText.selectable = false;
			_levelText.setTextFormat(_tfText);
			_levelText.alpha = 0;
			
			
			tf = new TextFormat("Papyrus", 140, 0xFFFFFFFF, true);
			_startCountText = new TextField;
			addChild(_startCountText);
			_startCountText.width = 900;
			_startCountText.height = 150;
			_startCountText.text = "";
			_startCountText.selectable = false;
			_startCountText.setTextFormat(tf);
			
			var tfFinish:TextFormat = new TextFormat("Papyrus", 50, 0xFFFFFFFF, true);
			_finishText = new TextField;
			addChild(_finishText);
			_finishText.width = 600;
			_finishText.height = 200;
			_finishText.text = "Congratulations you have finished level " + lvlMenu.level;
			_finishText.x = stage.stageWidth / 4.5;
			_finishText.y = stage.stageHeight / 3.5;
			_finishText.selectable = false;
			_finishText.wordWrap = true;
			_finishText.setTextFormat(tfFinish);
			_finishText.alpha = 0; 
			
			
			_speedBarTxt = new TextField;
			addChild(_speedBarTxt);
			_speedBarTxt.width = 600;
			_speedBarTxt.height = 1200;
			_speedBarTxt.text = "";
			_speedBarTxt.selectable = false;
			_speedBarTxt.wordWrap = true;
			_speedBarTxt.alpha = 0;
			
			var _diedTf:TextFormat = new TextFormat("Papyrus", 50, 0xFFFFFFFF, true);
			_diedText = new TextField;
			addChild(_diedText);
			_diedText.width = 600;
			_diedText.height = 200;
			_diedText.text = "YOU HAVE DIED!" ;
			_diedText.x = 200;
			_diedText.y = 350;
			_diedText.selectable = false;
			_diedText.setTextFormat(_diedTf);
			_diedText.alpha = 0;
			
			var tfMenu:TextFormat = new TextFormat("papyrus", 15, 0xFFFFFFFF, true); // variable voor de text style.
			_backMenu = new TextField();
			_backMenu.text = "Back to menu";
			_backMenu.y = 10; // text positie y
			_backMenu.x = 780; // text positie x
			addChild(_backMenu);
			_backMenu.width = _backMenu.textWidth + 1000; // maximale grootte text
			_backMenu.selectable = false;
			_backMenu.setTextFormat(tfMenu);
			_backMenu.alpha = 0;
			
			_background.x = 0;
			_background.y = 0;
			_background.width = stage.stageWidth;
			_background.height = stage.stageHeight;
			addChildAt(_background, 0);
			
			
			addEventListener(MouseEvent.MOUSE_OVER, onHoover, false, 0, true);
			addEventListener(MouseEvent.MOUSE_OUT, onOut, false, 0, true);
			_backMenu.addEventListener(MouseEvent.CLICK, onClick);
			
			if (lvlMenu.level == 6)
			{
				removeChild(_backMenu);
				removeChild(_levelText);
				removeChild(_life1);
				removeChild(_life2);
				removeChild(_life3);
			}
			
		}
		
		
/*----------------------------------------------------------------------StartCounter------------------------------------------------------------------------------*/

		public function startTimer(e:TimerEvent):void 
		{
			if (lvlMenu.level == 1 || lvlMenu.level == 2 || lvlMenu.level == 3 || lvlMenu.level == 4 || lvlMenu.level == 5)
			{
			var t:Timer = e.target as Timer;
			
			switch(t.currentCount)
			{
				case 1:
					
					_startCountText.text = "3";
					_startCountText.y = stage.stageHeight / 2.5;
					_startCountText.x = stage.stageWidth / 2;
					break;
				case 2:
					_startCountText.text = "2";
					_startCountText.y = stage.stageHeight / 2.5;
					_startCountText.x = stage.stageWidth / 2;
					break;
				case 3: 
					_startCountText.text = "1";
					_startCountText.y = stage.stageHeight / 2.5;
					_startCountText.x = stage.stageWidth / 2;
					break;
				case 4: 
					_startCountText.text = "";
					_startCountText.y = stage.stageHeight / 2;
					_startCountText.x = stage.stageWidth / 2;
					break;
			}
			_startCountText.setTextFormat(tf);
			}
		}

	
/* ----------------------------------------------------------------------KeyUP------------------------------------------------------------------------------------------*/

		public function keyUp(e:KeyboardEvent):void
		{
			if (lvlMenu.level == 1 || lvlMenu.level == 2 || lvlMenu.level == 3 || lvlMenu.level == 4 || lvlMenu.level == 5)
			{
			if (e.keyCode == 37) {
				_facing = 0;
			}
			else if (e.keyCode == 39) { // Key right
				_facing = 0;
			}
			else if (e.keyCode == 40) { // Key down
				_velocity.length = 5;
			}
				
			else if (e.keyCode == 38) { // Key up
				_velocity.length = 5;
				_speedBarSpeed = 0;
			}
			}
				if (lvlMenu.level == 6) { // Scroll fast and scroll break keys
					if (e.keyCode == 38) {
						_moveTxt = 1;
					}
					else if (e.keyCode == 40) {
						_moveTxt = 1;
					}
				}
		}
	

/* ----------------------------------------------------------------------KeyDown------------------------------------------------------------------------------------------*/

		public function keyDown(e:KeyboardEvent):void  // Movement van de Speler
		{
			
			if (lvlMenu.level == 1 || lvlMenu.level == 2 || lvlMenu.level == 3 || lvlMenu.level == 4 || lvlMenu.level == 5)
			{
			//trace(e.keyCode);
			if (e.keyCode == 38) { // key up
				_velocity.length = 10; // SPEED BOOST!
				_speedBarSpeed = 1;
				_speedBarBool = true;
				
				if (speedBar <= 0)
				{
					_speedBarBool = false;
					_velocity.length = 5;
					_speedBarSpeed = 0;
				}
			}
			else if (e.keyCode == 39) _facing = 1; // Rotatie van de Speler naar Rechts // key right
			
			else if (e.keyCode == 37) _facing = -1; // Rotatie van de speler naar Links // key left 
			
			else if (e.keyCode == 40) _velocity.length = 0;
			
			else if (e.keyCode == 80)  gamePaused = true; // P key
			
			else if (e.keyCode == 82) gamePaused = false; // R key
			
			}
			if (lvlMenu.level == 6) { // Scroll fast and scroll break keys
					if (e.keyCode == 38) _moveTxt = 2;
					
					if (e.keyCode == 40) _moveTxt = -1;
					
				}
	}
	
/* ----------------------------------------------------------------------Loop------------------------------------------------------------------------------------------*/

		public function loop(e:Event):void
		{
			
			///////// intro alpha! //////////
			_backMenu.alpha += 0.02;
			_levelText.alpha += 0.02;
			_speedBarTxt.alpha += 0.02;
			_life1.alpha += 0.02;
			_life2.alpha += 0.02;
			_life3.alpha += 0.02;
			
			if (_life1.alpha == 1 || _life2.alpha == 1 || _life3.alpha == 1 || _speedBarTxt.alpha == 1 || _levelText.alpha == 1 || _backMenu.alpha >= 1) {
			_backMenu.alpha = 1;
			_levelText.alpha = 1;
			_speedBarTxt.alpha = 1;
			_life1.alpha = 1;
			_life2.alpha = 1;
			_life3.alpha = 1;
			}
			
				if (lvlMenu.level == 6)
				{
					_endScreenTxt.y -= 2 * _moveTxt; //title screen movement, bestuurbaar met Up en Down
					if (_endScreenTxt.y < -1660) {
					dispatchEvent(new Event("complete"));
					}
				}
				
			

			if (lvlMenu.level == 1 || lvlMenu.level == 2 || lvlMenu.level == 3 || lvlMenu.level == 4 || lvlMenu.level == 5)
			{
			
			if (gamePaused) { // met deze functie word de Loop op pauze gezet.
				
			}
			else {
				//Respawn systeem voor als de Speler buiten het veld raakt word de juiste positie op 0 gezet.
			if (_location.y > 920) 
			{
				_location.y = -30;
			}
			if (_location.y < -30)
			{
				_location.y = 920;
			}
			if (_location.x > 980)
			{
				_location.x = -30;
			}
			if (_location.x < -30)
			{
				_location.x = 980;
			}
			
			// Movement Loops!
			_player.rotation += 10 * _facing; // rotatie van de speler
			
			_velocity.angle = (_player.rotation -90)* Math.PI/180; // rotatie omzetten naar Radius
			_location.add(_velocity); // add de snelheid
			_player.x = _location.x; // positie x
			_player.y = _location.y; // positie y
			
				
				if (speedBar <= 0)
				{
					_speedBarSpeed = 0;
				}
				if (_speedBarBool == false)
				{
					_velocity.length = 5;
				}
				else {
					speedBar -= _speedBarSpeed
				}
				
			
			var _speedBarTf:TextFormat = new TextFormat("Papyrus", 25, 0xFFFFFFFF, true);
			_speedBarTxt.x = 350;
			_speedBarTxt.y = 10;
			_speedBarTxt.text = "score boost :" + speedBar;
			_speedBarTxt.setTextFormat(_speedBarTf);
			
			
			_counter += 1;
			
			
//////////////////////////////////////////////////////////// HitTest! /////////////////////////////////////////////////////
			
			var headPoint : Point = _player.localToGlobal(new Point(0,-_player.height / 3));
			var BodyPointL : Point = _player.localToGlobal(new Point(-_player.width * 0.3, 0));
			var BodyPointR : Point = _player.localToGlobal(new Point(_player.width * 0.3, 0));
			//for (var i:int = 0; i < _enemy.length; i++ ) {
			for (var i : int = _enemy.length - 1; i >= 0 ; i--) { // achterwaardse loop om de enemys niet mee te laten tellen in de Counter.
																  //hierdoor kan de speler niet dood gaan terwijl hij een kleine enemy op eet. 
																// zonder de achterwaardse loop zou de splice niet goed uitgevoert worden.
				_enemy[i].loop();
				if (_counter > 128) {
					if (_enemy[i].hitTestPoint(headPoint.x, headPoint.y, true) || _enemy[i].hitTestPoint(BodyPointL.x, BodyPointL.y, true) ||  _enemy[i].hitTestPoint(BodyPointR.x, BodyPointR.y, true) )
					{
						
						if (_player.sizeFactor < _enemy[i].sizeFactor)
						{
								
								_coolDown += 1;
							if (_coolDown == 10) {
								
								_loseLifeSound.addEventListener(Event.COMPLETE, killedSound, false, 0, true);
								_loseLifeSound.play();
								
								killed += 1;
								_coolDown = 0;
								
									if (killed == 2) {
										_life3.die();
									}
									else if (killed == 3) {
										_life2.die();
									}
									else if (killed == 4) {
										_life1.die();
										
										soundChannel.stop(); // stopt de Muziek
										speedBar = 10;
										gamePaused = true;
										_counter = 0;
										
										break;
									}
							}
						}
						
						else if(_player.sizeFactor >= _enemy[i].sizeFactor)
						{
								if (lvlMenu.level == 1){
									_player.scaleX += 0.085;
									_player.scaleY += 0.085;
									speedBar += 10;
								}
								
								else if (lvlMenu.level == 2) {
									_player.scaleX += 0.06;
									_player.scaleY += 0.06;
									speedBar += 10;
								}
								
								else if (lvlMenu.level == 3) {
									_player.scaleX += 0.05;
									_player.scaleY += 0.05;
									speedBar += 10;
								}
								
								else if (lvlMenu.level == 4) {
									_player.scaleX += 0.07;
									_player.scaleY += 0.07;
									speedBar += 10;
								}
								
								else if (lvlMenu.level == 5) {
									_player.scaleX += 0.04;
									_player.scaleY += 0.04;
									speedBar += 10;
								}
								
							
							eatSound.addEventListener(Event.COMPLETE, eatMusic, false, 0, true);
							eatSound.play();
							
							removeChild(_enemy[i]);
							_enemy.splice(i, 1);
							
							_player.sizeFactor += 1;
						}	
						
						if (_player.sizeFactor >= 10)
							{
							_winBool = true;
							}
					}
				}	
			}
		}
			
		}
		
		if (killed == 4)
			{
				//trace(_counter);
				_diedText.alpha += 0.03;
				_counter += 1;
				if (_counter >= 70)
				{
					gamePaused = false;
					dispatchEvent(new Event("playerDeath"));
					_backMenu.removeEventListener(MouseEvent.CLICK, onClick);
					removeEventListener(Event.ENTER_FRAME, loop);
					
				}
			}
		if (_winBool == true)
		{
			_finishText.alpha += 0.01;
			_winCount += 1;
			
			if (_winCount == 150)
			{
				soundChannel.stop();
				dispatchEvent(new Event("finished"));
			}
		}
			
		}

/* ------------------------------------------------------------- onHoover / onOut ------------------------------------------------------------------------------*/
		
		private function onHoover(e:MouseEvent):void
		{
			if (e.target == _backMenu)
			{
				_backMenu.alpha = 0.7;
			}
		}
		
		private function onOut(e:MouseEvent):void
		{
			if (e.target == _backMenu)
			{
				_backMenu.alpha = 1;
			}
		}

/* ----------------------------------------------------------------------OnClick------------------------------------------------------------------------------------------*/

		public function onClick(e:MouseEvent):void
		{
				trace("pauzed");
				gamePaused = true; 
				dispatchEvent(new Event("openMenu")); // Opent de menu terug op het scherm
				soundChannel.stop();
				startCount.stop();
		}
		
/* ----------------------------------------------------------------------Finish------------------------------------------------------------------------------------------*/
		public function finished(e:MouseEvent):void
		{
			
			if (e.target == _finishText) { // als er op de _finishText geclickt word
				_finishText.visible = false;
				
				gamePaused = true;
				soundChannel.stop();
				
				dispatchEvent(new Event("finished"));
			}
		}
		
/* ----------------------------------------------------------------startMusic------------------------------------------------------------------------------------*/
		
		public function startMusic(e:Event):void
			{
				soundChannel = soundPlay.play(0,999999); //Sound System
			}
			
		public function eatMusic(e:Event):void
			{
				eatChannel = soundPlay.play(0,1); //Sound System
			}
			
		public function killedSound(e:Event):void
			{
				_loseLifeChannel = _loseLifeSound.play(0,1);
			}
	}
		
}