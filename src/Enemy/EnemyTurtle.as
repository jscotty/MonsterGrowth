package Enemy 
{
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyTurtle extends Enemys 
	{
		public function EnemyTurtle() 
		{
			enemy = new TurtleWalk;
			addChild(enemy);
			enemy.scaleX = 0.08;
			enemy.scaleY = 0.08;
			enemy.alpha = 0.05;
			sizeFactor = 1;
		}
		
	}

}