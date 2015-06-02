package Player 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PlayerLevelSky extends Player
	{
		private var _playerWalk:MovieClip;
		
		public function PlayerLevelSky() 
		{
			_playerWalk = new PlayerLevel4Fly;
			addChild(_playerWalk);
		}
		
	}

}