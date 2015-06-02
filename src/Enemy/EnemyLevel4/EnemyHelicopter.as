package Enemy.EnemyLevel4 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyHelicopter extends Enemys 
	{
		
		public function EnemyHelicopter() 
		{
			enemy = new HelicopterFly;
			addChild(enemy);
			enemy.scaleX = 0.25;
			enemy.scaleY = 0.25;
			enemy.alpha = 0.05;
			sizeFactor = 1;
		}
		
	}

}