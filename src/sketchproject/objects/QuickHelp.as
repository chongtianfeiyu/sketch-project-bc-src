package sketchproject.objects
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import sketchproject.core.Assets;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class QuickHelp extends Sprite
	{
		private var overlay:Quad;
		private var help:Image;
		
		public function QuickHelp()
		{
			super();
			
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.3;	
			overlay.color = 0xFFFFFF;
			addChild(overlay);
			
			help = new Image(Assets.getTexture("SpriteQuickHelp"));
			help.pivotX = help.width * 0.5;
			help.pivotY = help.height * 0.5;
			addChild(help);
			
			addEventListener(TouchEvent.TOUCH, onTouch);
			
			scaleX = 0.5;
			scaleY = 0.5;
			alpha = 0;
			visible = false;
		}
		
		private function onTouch(event:TouchEvent):void
		{
			if (event.getTouch(this, TouchPhase.ENDED))
			{
				closeDialog();
			}
		}
		
		public function openDialog():void
		{
			visible = true;
			TweenMax.to(
				this,
				0.7,
				{
					ease:Back.easeOut,
					scaleX:1,
					scaleY:1,
					alpha:1,
					delay:1
				}
			);	
		}
		
		public function closeDialog():void
		{
			TweenMax.to(
				this,
				0.5,
				{
					ease:Back.easeIn,
					scaleX:0.5,
					scaleY:0.5,
					alpha:0,
					delay:0.2,
					onComplete:function():void{
						removeFromParent(true);
					}
				}
			);
		}
	}
}