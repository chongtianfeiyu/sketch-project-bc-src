package sketchproject.objects.dialog
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.events.DialogBoxEvent;
	import sketchproject.interfaces.IDialog;
	import sketchproject.managers.FireworkManager;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	
	public class Help extends Sprite
	{
		private var overlay:Quad;
		private var background:Image;
		private var menu:Image;
		private var selected:Image;
		
		private var buttonClose:Button;
		private var slider:Image;
		private var track:Image;
		private var contentMask:Quad;
		
		private var title:TextField;
		private var subtitle:TextField;
		private var text:TextField;
		
		private var content:Sprite;
		
		private var active:uint;
		
		private var buttonMenu1:Quad;
		private var buttonMenu2:Quad;
		private var buttonMenu3:Quad;
		private var buttonMenu4:Quad;
		private var buttonMenu5:Quad;
		private var buttonMenu6:Quad;
		private var buttonMenu7:Quad;
		
		private var fireworkManager:FireworkManager;
		
		public function Help()
		{
			super();
			fireworkManager = new FireworkManager(Game.overlayStage);
			active = 0;
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.8;		
			overlay.color = 0x000000;
			addChild(overlay);
			
			background = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("dialog_help"));
			background.pivotX = background.width * 0.5;
			background.pivotY = background.height * 0.5;
			addChild(background);
			
			buttonClose = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_cross"));
			buttonClose.pivotX = buttonClose.width * 0.5;
			buttonClose.pivotY = buttonClose.height * 0.5;
			buttonClose.x = background.width * 0.5 - 110;
			buttonClose.y = -background.height * 0.5 + 92;
			addChild(buttonClose);
			
			selected = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("help_menu_selected"));
			selected.x = -370;
			selected.y = -144;
			addChild(selected);
			
			menu = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("help_menu"));
			menu.x = -340;
			menu.y = -125;
			addChild(menu);
						
			track = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("help_slider_track"));
			track.pivotX = track.width * 0.5;
			track.x = 340;
			track.y = -100;
			addChild(track);
			
			slider = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("help_slider"));
			slider.pivotX = slider.width * 0.5;
			slider.x = 340;
			slider.y = -100;
			addChild(slider);
						
			contentMask = new Quad(400,340);
			contentMask.x = -80;
			contentMask.y = -130;
			contentMask.alpha = 1;			
			addChild(contentMask);
			
			
			buttonMenu1 = new Quad(200, 40);
			buttonMenu1.x = -340;
			buttonMenu1.y = -130;
			buttonMenu1.alpha = 0;
			addChild(buttonMenu1);
			
			buttonMenu2 = new Quad(200, 40);
			buttonMenu2.x = -340;
			buttonMenu2.y = buttonMenu1.y + buttonMenu1.height + 13;
			buttonMenu2.alpha = 0;
			addChild(buttonMenu2);
			
			buttonMenu3 = new Quad(200, 40);
			buttonMenu3.x = -340;
			buttonMenu3.y = buttonMenu2.y + buttonMenu2.height + 13;
			buttonMenu3.alpha = 0;
			addChild(buttonMenu3);
			
			buttonMenu4 = new Quad(200, 40);
			buttonMenu4.x = -340;
			buttonMenu4.y = buttonMenu3.y + buttonMenu3.height + 13;
			buttonMenu4.alpha = 0;
			addChild(buttonMenu4);
			
			buttonMenu5 = new Quad(200, 40);
			buttonMenu5.x = -340;
			buttonMenu5.y = buttonMenu4.y + buttonMenu4.height + 13;
			buttonMenu5.alpha = 0;
			addChild(buttonMenu5);
			
			buttonMenu6 = new Quad(200, 40);
			buttonMenu6.x = -340;
			buttonMenu6.y = buttonMenu5.y + buttonMenu5.height + 13;
			buttonMenu6.alpha = 0;
			addChild(buttonMenu6);
			
			buttonMenu7 = new Quad(200, 40);
			buttonMenu7.x = -340;
			buttonMenu7.y = buttonMenu6.y + buttonMenu6.height + 13;
			buttonMenu7.alpha = 0;
			addChild(buttonMenu7);
			//content.mask = contentMask;
			
			buttonClose.addEventListener(Event.TRIGGERED, onPrimaryTrigerred);			
			addEventListener(TouchEvent.TOUCH, menuTouch);
			
			this.scaleX = 0.5;
			this.scaleY = 0.5;
			this.alpha = 0;
			visible = false;
		}
		
				
		private function menuTouch(event:TouchEvent):void
		{				
			if (event.getTouch(buttonMenu1, TouchPhase.ENDED))
			{
				TweenMax.to(selected,0.3,{y:buttonMenu1.y-14});
			}	
			if (event.getTouch(buttonMenu2, TouchPhase.ENDED))
			{
				TweenMax.to(selected,0.3,{y:buttonMenu2.y-14});
			}
			if (event.getTouch(buttonMenu3, TouchPhase.ENDED))
			{
				TweenMax.to(selected,0.3,{y:buttonMenu3.y-14});
			}
			if (event.getTouch(buttonMenu4, TouchPhase.ENDED))
			{
				TweenMax.to(selected,0.3,{y:buttonMenu4.y-14});
			}
			if (event.getTouch(buttonMenu5, TouchPhase.ENDED))
			{
				TweenMax.to(selected,0.3,{y:buttonMenu5.y-14});
			}
			if (event.getTouch(buttonMenu6, TouchPhase.ENDED))
			{
				TweenMax.to(selected,0.3,{y:buttonMenu6.y-14});
			}
			if (event.getTouch(buttonMenu7, TouchPhase.ENDED))
			{
				TweenMax.to(selected,0.3,{y:buttonMenu7.y-14});
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
					scaleX:0.9,
					scaleY:0.9,
					alpha:1,
					delay:0.2
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
						visible = false;
					}
				}
			);
		}
		
		
		private function onSecondaryTrigerred(event:Event):void
		{
			// nothing
		}
		
		private function onPrimaryTrigerred(event:Event):void
		{
			closeDialog();
		}	
		
		
		
		
		
		private var scrollSpeed:Number = .5;// seconds to movie to new position
		private var scrollWheelSpeed:int = 10;// pixels per tick
		
		
		/**
		* Enable Scrollbar interaction
		*/
		private function enable():void
		{
			// make dragger a button
			//slider.buttonMode = true;
			
			// add event listeners
			slider.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelHandler);
			stage.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
			
			// check if scrollbar is needed;
			verifyHeight();
		}
		
		/**
		 * Disable Scrollbar interaction
		 */
		private function disable():void
		{
			// make dragger not a button
			//slider.buttonMode = false;
			
			// remove event listeners
			slider.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);
			this.removeEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheelHandler);
			this.removeEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
		}
		
		/**
		 * On mouse wheel handler
		 * @param$eventTakes MouseEvent argument
		 */
		private function onMouseWheelHandler(event:MouseEvent):void
		{
			// define parameters
			var scrollDistance:int = event.delta;
			var minY:int = track.y;
			var maxY:int = track.height + track.y - slider.height;
			
			// check if there's room to scroll
			if ((scrollDistance > 0 && slider.y <= maxY) || (scrollDistance < 0 && slider.y >= minY))
			{
				// move dragger
				slider.y = slider.y - (scrollDistance * scrollWheelSpeed);
				
				// make sure we don't come out of our boundries
				if (slider.y < minY)
				{
					slider.y = minY;
				}
				else if (slider.y > maxY)
				{
					slider.y = maxY;
				}
				
				// move content
				updateContentPosition();
			}
		}
		
		/**
		 * On mouse down handler
		 * @param$eventTakes MouseEvent argument
		 */
		private function onMouseDownHandler($event:MouseEvent):void
		{
			var newRect:Rectangle = new Rectangle(track.x,track.y,0,track.height - slider.height);
			//slider.startDrag(false, newRect);
			stage.addEventListener(Event.ENTER_FRAME, updateContentPosition);
		}
		
		/**
		 * On mouse up handler
		 * @param$eventTakes MouseEvent argument
		 */
		private function onMouseUpHandler(event:MouseEvent):void
		{
			//slider.stopDrag();
			
			if (stage != null)
			{
				stage.removeEventListener(Event.ENTER_FRAME, updateContentPosition);
			}
		}
		
		/**
		 * Update content position
		 * @param$eventTakes optional Event argument
		 */
		private function updateContentPosition(event:Event = null):void
		{
			var scrollPercent:Number =  100 / (track.height - slider.height)  * ( slider.y - track.y);
			var newContentY:Number = contentMask.y + (contentMask.height - content.height) / 100 * scrollPercent;
			content.y = newContentY;
			//var tweenScroll:Tween = new  Tween(_content,"y",Strong.easeInOut,_content.y,newContentY, _scrollSpeed, true);
			//TweenLite.to(_content, _scrollSpeed, {y:newContentY, ease:Cubic.easeOut});
		}
		
		/**
		 * Position Slider based on where the content is.
		 * Use this function if content is being moved by anything outside the scrollbar class
		 */
		private function updateSliderPosition():void
		{
			var contentPercent:Number = Math.abs((content.y - contentMask.y) / (content.height - contentMask.height) * 100);
			
			var newDraggerY:int = (contentPercent / 100 * (track.height - slider.height)) + track.y;
			
			slider.y = newDraggerY;
		}
		
		/**
		 * Check if scrollbar is necessary
		 */
		private function verifyHeight():void
		{
			if (contentMask.height >= content.height)
			{
				slider.visible = false;
				track.visible = false;
			}
			else
			{
				slider.visible = true;
				track.visible = true;
			}
		}
		
		/**
		 * Garbage collection method
		 */
		private function destroy():void
		{
			// check if dragger is being dragged
			if (stage.hasEventListener(Event.ENTER_FRAME))
			{
				//slider.stopDrag();
				stage.removeEventListener(Event.ENTER_FRAME, updateContentPosition);
			}
			
			// disable interaction
			disable();
		}
	}
}