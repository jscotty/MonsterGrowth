package Enemy.EnemyLevel5 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyPlanetTwo extends Enemys 
	{
		
		public function EnemyPlanetTwo() 
		{
			enemy = new VenusWalk;
			addChild(enemy);
			enemy.scaleX = 0.54;
			enemy.scaleY = 0.54;
			enemy.alpha = 0.05;
			sizeFactor = 8;
		}
		
	}

}