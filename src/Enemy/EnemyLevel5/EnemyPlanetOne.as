package Enemy.EnemyLevel5 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyPlanetOne extends Enemys 
	{
		
		public function EnemyPlanetOne() 
		{
			enemy = new PlanetWalk;
			addChild(enemy);
			enemy.scaleX = 0.23;
			enemy.scaleY = 0.23;
			enemy.alpha = 0.05;
			sizeFactor = 7;
		}
		
	}

}