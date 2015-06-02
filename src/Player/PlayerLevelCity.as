package Player 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PlayerLevelCity extends Player
	{
		private var _playerWalk:PlayerCityWalk;
		
		public function PlayerLevelCity() 
		{
			_playerWalk = new PlayerCityWalk;
			addChild(_playerWalk);
			
		}
		
	}

}