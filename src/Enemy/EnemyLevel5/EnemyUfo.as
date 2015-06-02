package Enemy.EnemyLevel5 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyUfo extends Enemys 
	{
		
		public function EnemyUfo() 
		{
			enemy = new UfoFly;
			addChild(enemy);
			enemy.scaleX = 0.25;
			enemy.scaleY = 0.25;
			enemy.alpha = 0.05;
			sizeFactor = 4;
		}
		
	}

}