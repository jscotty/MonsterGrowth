package Enemy.EnemyLevel3 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyCar extends Enemys 
	{
		
		public function EnemyCar() 
		{
			enemy = new CarRide;
			addChild(enemy);
			enemy.scaleX = 0.25;
			enemy.scaleY = 0.25;
			enemy.alpha = 0.05;
			sizeFactor = 4;
		}
		
	}

}