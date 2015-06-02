package Enemy.EnemyLevel4 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyPlane extends Enemys 
	{
		
		public function EnemyPlane() 
		{
			enemy = new PlaneFly;
			addChild(enemy);
			enemy.scaleX = 0.44;
			enemy.scaleY = 0.44;
			enemy.alpha = 0.05;
			sizeFactor = 7;
		}
		
	}

}