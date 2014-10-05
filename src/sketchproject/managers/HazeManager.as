package sketchproject.managers
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Elastic;
	
	import sketchproject.interfaces.IParticle;
	
	import sketchproject.objects.loading.Haze;
	import sketchproject.objects.loading.PreloadAssets;
	
	import starling.core.Starling;
	import starling.core.StarlingPool;
	
	import sketchproject.states.Preloading;

	public class HazeManager implements IParticle
	{
		private var preloading:PreloadAssets;
		private var hazePool:StarlingPool;
		public var hazes:Array;		
		
		public function HazeManager(preloading:PreloadAssets)
		{
			this.preloading = preloading;
			hazes = new Array();
			hazePool = new StarlingPool(Haze, 100);
		}
		
		public function update():void
		{
			if(Math.random() < 0.05)
				spawn(Math.random() * (Starling.current.nativeStage.stageWidth - 100) + 50,Math.random() * (Starling.current.nativeStage.stageHeight - 300) + 50);
			
			var haze:Haze;
			var len:int = hazes.length;
			for(var i:int=len-1; i>=0; i--)
			{
				haze = hazes[i];
				haze.y -= 0.5;
				if((haze.positionHaze - haze.y) > 30)
					TweenMax.to(haze,1.5,{scaleX:0, scaleY:0.1, alpha:0.1, ease:Elastic.easeOut,onComplete:destroyHaze, onCompleteParams:[haze]});					
			}
		}
		
		private function destroyHaze(haze:Haze):void
		{
			var len:int = hazes.length;
			
			for(var i:int=0; i<len; i++)
			{
				if(haze == hazes[i])
				{
					hazes.splice(i, 1);
					haze.removeFromParent(true);
					hazePool.returnSprite(haze);
				}
			}
		}
		
		public function spawn(x:int, y:int):void
		{
			var haze:Haze = hazePool.getSprite() as Haze;
			hazes.push(haze);
			haze.x = x;
			haze.y = y;
			haze.positionHaze = haze.y;			
			preloading.hazeContainer.addChild(haze);
			TweenMax.to(haze,1.5,{scaleX:1, scaleY:1, alpha:1, ease:Elastic.easeOut});
		}
		
		public function destroy():void
		{
			hazePool.destroy();
			hazePool = null;
			hazes = null;
		}
	}
}