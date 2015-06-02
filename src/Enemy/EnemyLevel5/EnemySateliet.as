package Enemy.EnemyLevel5 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemySateliet extends Enemys 
	{
		
		public function EnemySateliet() 
		{
			enemy = new SatelietMove;
			addChild(enemy);
			enemy.scaleX = 0.1;
			enemy.scaleY = 0.1;
			enemy.alpha = 0.05;
			sizeFactor = 1;
		}
		
	}

}