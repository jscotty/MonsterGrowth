package Enemy 
{
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyHermitCrab extends Enemys
	{
		
		public function EnemyHermitCrab() 
		{
			enemy = new HermitWalk;
			addChild(enemy);
			enemy.scaleX = 0.385;
			enemy.scaleY = 0.385;
			enemy.alpha = 0.05;
			sizeFactor = 4;
		}
		
	}

}