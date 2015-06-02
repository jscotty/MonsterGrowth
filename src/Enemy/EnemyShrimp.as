package Enemy 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyShrimp extends Enemys 
	{
		
		public function EnemyShrimp() 
		{
			enemy = new ShrimpWalk;
			addChild(enemy);
			enemy.scaleX = 0.3;
			enemy.scaleY = 0.3;
			enemy.alpha = 0.05;
			sizeFactor = 4;
			
		}
		
	}

}