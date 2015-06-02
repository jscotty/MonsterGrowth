package Enemy 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import utils.Vector2D;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyVis extends Enemys 
	{
		public function EnemyVis() 
		{
			enemy = new Enemy;
			addChild(enemy);
			enemy.scaleX = 1;
			enemy.scaleY = 1;
			enemy.alpha = 0.05;
			sizeFactor = 7;
			
		}
		
	}

}