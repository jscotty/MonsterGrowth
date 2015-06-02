package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author justin Bieshaar
	 */
	public class Player extends MovieClip 
	{
		private var deathAnimatie:MovieClip;
		private var walkAnimatie:MovieClip;
		public var sizeFactor:int = 1;
		
		public function Player() 
		{
			walkAnimatie = new PlayerWalk; // Idle/Walk animate
			deathAnimatie = new PlayerDeath; // Death animatie
			
			addChild(deathAnimatie); // toevoegen van Death animaties
			addChild(walkAnimatie); // Toevoegen van Idle/Walk animatie
			
			deathAnimatie.visible = false; // Zodat er niet 2 animaties tegelijk aan staan.
		}
		public function animatieSpelen(animNr:int):void
		{
			if (animNr == 0) // animNr 0 voor de Idle Animatie.
			{
				walkAnimatie.visible = true;
				deathAnimatie.visible = false; 
			}
			if (animNr == 1) // animNr 1 voor de Dood Animatie.
			{
				walkAnimatie.visible = false;
				deathAnimatie.visible = true;
			}
		}
		


	}
}