package sketchproject.core
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	
	import sketchproject.interfaces.IState;
	import sketchproject.objects.dialog.Option;
	import sketchproject.states.MainMenu;
	import sketchproject.states.Parameter;
	import sketchproject.states.Play;
	import sketchproject.states.Preloading;
	import sketchproject.utilities.Config;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.ResizeEvent;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.RectangleUtil;
	import starling.utils.ScaleMode;
	
	public class Game extends Sprite
	{
		public static const PRELOADING_STATE:int = 0;
		public static const MENU_STATE:int = 1;
		public static const PARAMETER_STATE:int = 2;
		public static const PLAY_STATE:int = 3;
		public static const BUSINESS_STATE:int = 4;
		public static const GAME_OVER_STATE:int = 5;
		
		private var current_state:IState;
		
		public static var gameStage:Sprite;
		public static var overlayStage:Sprite;
		public static var cursor:Image;
		
		private var xPos:Number = 0;
		private var yPos:Number = 0;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			Starling.current.stage.addEventListener(ResizeEvent.RESIZE, onResize);
		}
		
		private function init(event:Event):void
		{			
			gameStage = new Sprite();
			addChild(gameStage);
			
			overlayStage = new Sprite();
			addChild(overlayStage);
			
			Mouse.hide();
			
			cursor = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("cursor"));
			cursor.x = stage.stageWidth * 0.5;
			cursor.y = stage.stageHeight* 0.5;
			cursor.scaleX = 0.9;
			cursor.scaleY = 0.9;
			gameStage.addChild(cursor);
			
			Assets.init();
			changeState(PLAY_STATE);
			addEventListener(Event.ENTER_FRAME, update);
			
		}
				
		private function onResize(event:ResizeEvent, size:Point):void
		{
			RectangleUtil.fit(
				new Rectangle(0, 0, stage.stageWidth, stage.stageHeight),
				new Rectangle(0, 0, size.x, size.y),
				ScaleMode.SHOW_ALL, false,
				Starling.current.viewPort
			);
			trace(size.x+"   "+size.y);
		}
		
		public function changeState(state:int):void
		{
			if(current_state != null)
			{
				current_state.destroy();
				current_state = null;
			}
			
			switch(state)
			{
				case PRELOADING_STATE:
					current_state = new Preloading(this);
					break;
				
				case MENU_STATE:
					current_state = new MainMenu(this);
					break;
				
				case PARAMETER_STATE:
					current_state = new Parameter(this);
					break;
				
				case PLAY_STATE:
					current_state = new Play(this);
					break;
				
				case GAME_OVER_STATE:
					//current_state = new GameOver(this);
					break;
			}
			
			gameStage.addChild(Sprite(current_state));
			
			if(gameStage.getChildIndex(Sprite(current_state)) > getChildIndex(cursor))
			{
				gameStage.swapChildren(Sprite(current_state), cursor);
			}
			
		}
		
		private function update(event:Event):void
		{
			current_state.update();	
			
			cursor.x = Starling.current.nativeOverlay.mouseX + 5;
			cursor.y = Starling.current.nativeOverlay.mouseY + 5;
		}
	}
}