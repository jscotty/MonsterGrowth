package Enemy 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import utils.Vector2D;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Enemys extends MovieClip
	{
		public var enemy:MovieClip;
		public var enemyLocation:Vector2D; // Locatie voor de enemy.
		public var randomMovement:Vector2D; // Random movement van de Enemy.
		public var enemyFacing:Number = 0;
		public var sizeFactor:int;
		
		
		public function Enemys() 
		{
			randomMovement = new Vector2D(1, 1);
			randomMovement.length = 1;
			this.rotation = Math.random() * 360;
			
		}
		
		public function loop():void
		{ 
			enemy.alpha += 0.009;
			if (enemy.alpha >= 1) enemy.alpha = 1;
			//enemy movement
			randomMovement.angle = (this.rotation -90) * Math.PI / 180;
			enemyLocation.add(randomMovement);
			this.x = enemyLocation.x;
			this.y = enemyLocation.y;
			
			this.rotation += 1 * enemyFacing;
			
			if ( enemyLocation.y < 200) {
					enemyFacing = Math.random() * 1;
				}
				if ( enemyLocation.y < 400) {
					enemyFacing = Math.random() * -1;
				}
				if ( enemyLocation.y > stage.stageWidth) {
					enemyFacing = Math.random() * 0;
				}
				
			 //Respawns
			if (enemyLocation.y > 920) 
			{
				enemyLocation.y = -30;
			}
			if (enemyLocation.y < -30)
			{
				enemyLocation.y = 920;
			}
			if (enemyLocation.x > 980)
			{
				enemyLocation.x = -30;
			}
			if (enemyLocation.x < -30)
			{
				enemyLocation.x = 980;
			}
			}
		}
		
	}

