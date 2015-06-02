package Enemy.EnemyLevel5 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyPlanetThree extends Enemys 
	{
		
		public function EnemyPlanetThree() 
		{
			enemy = new SaturnusWalk;
			addChild(enemy);
			enemy.scaleX = 0.74;
			enemy.scaleY = 0.74;
			enemy.alpha = 0.05;
			sizeFactor = 9;
		}
		
	}

}