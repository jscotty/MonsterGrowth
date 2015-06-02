package Player 
{
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PlayerLevelUnivers extends Player
	{
		private var _playerWalk:PlayerLevel5Walk;
		
		public function PlayerLevelUnivers() 
		{
			_playerWalk = new PlayerLevel5Walk;
			addChild(_playerWalk);
		}
		
	}

}