package Enemy.EnemyLevel3 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyBike extends Enemys 
	{
		
		public function EnemyBike() 
		{
			enemy = new BikeRide;
			addChild(enemy);
			enemy.scaleX = 0.555;
			enemy.scaleY = 0.555;
			enemy.alpha = 0.05;
			sizeFactor = 1;
		}
		
	}

}