package Enemy 
{
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyGull extends Enemys 
	{
		
		public function EnemyGull() 
		{
			enemy = new GullWalk;
			addChild(enemy);
			enemy.scaleX = 0.225;
			enemy.scaleY = 0.225;
			enemy.alpha = 0.05;
			sizeFactor = 7;
		}
		
	}

}