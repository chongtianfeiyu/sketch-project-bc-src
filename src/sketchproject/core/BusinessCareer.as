package sketchproject.core
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(frameRate=60, width="1000", height="560", backgroundColor="0x333333")]
	public class BusinessCareer extends Sprite
	{
		private var coreGame:Starling;
		
		public function BusinessCareer()
		{
			coreGame = new Starling(Game, stage);
			coreGame.antiAliasing = 1;
			coreGame.showStats = true;
			coreGame.start();
			trace("GAME FRAMEWORK START");
		}
	}
}