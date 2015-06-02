package Enemy.EnemyLevel3 
{
	import Enemy.Enemys;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyTruck extends Enemys
	{
		
		public function EnemyTruck() 
		{
			enemy = new TruckRide;
			addChild(enemy);
			enemy.scaleX = 1.2;
			enemy.scaleY = 1.2;
			enemy.alpha = 0.05;
			sizeFactor = 7;
		}
		
	}

}