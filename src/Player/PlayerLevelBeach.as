package Player 
{
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class PlayerLevelBeach extends Player 
	{
		private var _beachWalk:PlayerBeach;
		
		public function PlayerLevelBeach() 
		{
			_beachWalk = new PlayerBeach;
			addChild(_beachWalk);
			
		}
		
	}

}