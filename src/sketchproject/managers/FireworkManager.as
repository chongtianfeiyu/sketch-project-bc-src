package sketchproject.managers
{
	import sketchproject.interfaces.IParticle;
	import sketchproject.objects.particle.Firework;
	
	import starling.core.Starling;
	import starling.core.StarlingPool;
	import starling.display.Sprite;
	import starling.events.Event;

	public class FireworkManager implements IParticle
	{
		private var pool:StarlingPool;
		private var container:Sprite;
		
		public function FireworkManager(parent:Sprite)
		{
			pool = new StarlingPool(Firework, 15);
			container = parent;
		}
		
		public function spawn(x:int, y:int):void
		{
			var firestar:Firework = pool.getSprite() as Firework;
			firestar.emitterX = x;
			firestar.emitterY = y;
			firestar.start(0.1);
			container.addChild(firestar);
			Starling.juggler.add(firestar);
			firestar.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onComplete(event:Event):void
		{
			var firestar:Firework = event.currentTarget as Firework;
			Starling.juggler.remove(firestar);
			
			if(pool != null)
				pool.returnSprite(firestar);
		}
		
		public function destroy():void
		{
			for(var i:int=0; i<pool.items.length; i++)
			{
				var firestar:Firework = pool.items[i];
				firestar.dispose();
				firestar = null;
			}
			pool.destroy();
			pool = null;
		}
	}
}