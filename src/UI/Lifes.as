package UI 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Lifes extends MovieClip
	{
		private var lifeNormal:LifePoint;
		private var lifeDead:LifeDeath;
		
		public function Lifes() 
		{
			lifeNormal = new LifePoint;
			addChild(lifeNormal);
			
		
		}
		private function checkAnim(e:Event):void
		{
			
			if (lifeDead.anim.currentFrame == lifeDead.anim.framesLoaded)
			{
				
				removeChild(lifeDead);
				this.removeEventListener(Event.ENTER_FRAME, checkAnim);
			}
		}
		public function die():void
		{
			lifeDead = new LifeDeath;
			addChild(lifeDead);
			
			removeChild(lifeNormal);
			
			
			this.addEventListener(Event.ENTER_FRAME, checkAnim);
		}
		
/*		public function lifeAnim(animNr:int):void
		{
			if (animNr == 0) 
			{
				lifeNormal.visible = true;
				lifeDead.visible = false; 
			}
			if (animNr == 1) 
			{
				lifeNormal.visible = false;
				lifeDead.visible = true;
			}
		}*/
		
	}

}