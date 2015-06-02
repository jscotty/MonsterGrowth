package Enemy 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class EnemyKwal extends Enemys
	{
		
		public function EnemyKwal() 
		{
			enemy = new JellyWalk;
			addChild(enemy);
			enemy.scaleX = 0.14;
			enemy.scaleY = 0.14;
			enemy.alpha = 0.05;
			sizeFactor = 1;
			
			//addEventListener(Event.ENTER_FRAME, loop);
		}
		
		/*public function loop(e:Event):void
		{
			
		}*/
		
	}

}