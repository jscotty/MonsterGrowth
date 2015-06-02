package Enemy.EnemyLevel4 
{
	import Enemy.Enemys;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyFighter extends Enemys 
	{
		
		public function EnemyFighter() 
		{
			enemy = new FighterFly;
			addChild(enemy);
			enemy.scaleX = 0.43;
			enemy.scaleY = 0.43;
			enemy.alpha = 0.05;
			sizeFactor = 4;
		}
		
	}

}