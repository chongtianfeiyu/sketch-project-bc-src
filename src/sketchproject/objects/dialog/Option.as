package sketchproject.objects.dialog
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import flash.display.StageDisplayState;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.events.DialogBoxEvent;
	import sketchproject.interfaces.IDialog;
	import sketchproject.managers.FireworkManager;
	import sketchproject.utilities.Config;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Option extends Sprite
	{
		public static var STATE_FULLSCREEN:String = "fullscreen";
		public static var STATE_WINDOW:String = "window";
		
		private var overlay:Quad;
		private var background:Image;
		private var volumeValue:Image;
		
		private var buttonClose:Button;
		
		private var buttonPlusBgm:Button;
		private var buttonMinBgm:Button;
		private var buttonPlusSfx:Button;
		private var buttonMinSfx:Button;
		
		private var buttonWindow:Button;
		private var buttonFullscreen:Button;
		private var buttonConfirm:Button;
		private var buttonDiscard:Button;
		private var buttonFacebook:Button;
		private var buttonTwitter:Button;
		
		public static var volumeSfx:uint;
		public static var volumeBgm:uint;
		
		private var screen:String;
		
		private var sfxVolumeBar:Sprite;
		private var bgmVolumeBar:Sprite;
		
		private var fireworkManager:FireworkManager;
		
		public function Option()
		{
			super();
			
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			volumeBgm = Config.volbgm;
			volumeSfx = Config.volsfx;
			screen = Config.mode;
			
			initObjectProperty();
			updateSetting();			
		}
		
		public function initObjectProperty():void
		{
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.8;	
			overlay.color = 0x000000;
			addChild(overlay);
			
			background = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("dialog_option"));
			background.pivotX = background.width * 0.5;
			background.pivotY = background.height * 0.5;
			addChild(background);
						
			buttonClose = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_cross"));
			buttonClose.pivotX = buttonClose.width * 0.5;
			buttonClose.pivotY = buttonClose.height * 0.5;
			buttonClose.x = background.width * 0.5 - 105;
			buttonClose.y = -background.height * 0.5 + 92;
			addChild(buttonClose);
			
			buttonPlusBgm = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_plus"));
			buttonPlusBgm.pivotX = buttonPlusBgm.width * 0.5;
			buttonPlusBgm.pivotY = buttonPlusBgm.height * 0.5;
			buttonPlusBgm.x = 220;
			buttonPlusBgm.y = -65;
			addChild(buttonPlusBgm);
			
			buttonMinBgm = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_min"));
			buttonMinBgm.pivotX = buttonMinBgm.width * 0.5;
			buttonMinBgm.pivotY = buttonMinBgm.height * 0.5;
			buttonMinBgm.x = -35;
			buttonMinBgm.y = -65;
			addChild(buttonMinBgm);
			
			bgmVolumeBar = new Sprite();
			bgmVolumeBar.pivotY = buttonMinBgm.height * 0.5;
			bgmVolumeBar.x = -8;
			bgmVolumeBar.y = -65;
			addChild(bgmVolumeBar);
			
			buttonPlusSfx = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_plus"));
			buttonPlusSfx.pivotX = buttonPlusSfx.width * 0.5;
			buttonPlusSfx.pivotY = buttonPlusSfx.height * 0.5;
			buttonPlusSfx.x = 220;
			buttonPlusSfx.y = 0;
			addChild(buttonPlusSfx);
			
			buttonMinSfx = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_min"));
			buttonMinSfx.pivotX = buttonMinSfx.width * 0.5;
			buttonMinSfx.pivotY = buttonMinSfx.height * 0.5;
			buttonMinSfx.x = -35;
			buttonMinSfx.y = 0;
			addChild(buttonMinSfx);
			
			sfxVolumeBar = new Sprite();
			sfxVolumeBar.pivotY = buttonMinSfx.height * 0.5;
			sfxVolumeBar.x = -8;
			sfxVolumeBar.y = 0;
			addChild(sfxVolumeBar);
			
			buttonWindow = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_window"));
			buttonWindow.pivotX = buttonWindow.width * 0.5;
			buttonWindow.pivotY = buttonWindow.height * 0.5;
			buttonWindow.x = 10;
			buttonWindow.y = 65;
			addChild(buttonWindow);
			
			buttonFullscreen = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_fullscreen"));
			buttonFullscreen.pivotX = buttonFullscreen.width * 0.5;
			buttonFullscreen.pivotY = buttonFullscreen.height * 0.5;
			buttonFullscreen.x = 165;
			buttonFullscreen.y = 65;
			addChild(buttonFullscreen);
			
			buttonDiscard = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_discard"));
			buttonDiscard.pivotX = buttonDiscard.width * 0.5;
			buttonDiscard.pivotY = buttonDiscard.height * 0.5;
			buttonDiscard.x = 20;
			buttonDiscard.y = 150;
			addChild(buttonDiscard);
			
			buttonConfirm = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_confirm"));
			buttonConfirm.pivotX = buttonConfirm.width * 0.5;
			buttonConfirm.pivotY = buttonConfirm.height * 0.5;
			buttonConfirm.x = 175;
			buttonConfirm.y = 150;
			addChild(buttonConfirm);
			
			buttonFacebook = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_social_facebook"));
			buttonFacebook.pivotX = buttonFacebook.width * 0.5;
			buttonFacebook.pivotY = buttonFacebook.height * 0.5;
			buttonFacebook.x = -200;
			buttonFacebook.y = 150;
			addChild(buttonFacebook);
			
			buttonTwitter = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_social_twitter"));
			buttonTwitter.pivotX = buttonTwitter.width * 0.5;
			buttonTwitter.pivotY = buttonTwitter.height * 0.5;
			buttonTwitter.x = -135;
			buttonTwitter.y = 150;
			addChild(buttonTwitter);
			
			addEventListener(TouchEvent.TOUCH, onTouch);
			buttonFullscreen.addEventListener(TouchEvent.TOUCH, modeFullscreen);
			buttonWindow.addEventListener(TouchEvent.TOUCH, modeWindow);
			
			buttonClose.addEventListener(Event.TRIGGERED, onSecondaryTrigerred);			
			buttonConfirm.addEventListener(Event.TRIGGERED, onPrimaryTrigerred);
			buttonDiscard.addEventListener(Event.TRIGGERED, onSecondaryTrigerred);
			
			scaleX = 0.5;
			scaleY = 0.5;
			alpha = 0;
			visible = false;
		}
		
		private function onSecondaryTrigerred(event:Event):void
		{
			this.bgmVolume = Config.volbgm;
			this.sfxVolume = Config.volsfx;
			this.updateSetting();
			this.closeDialog();
		}
		
		private function onPrimaryTrigerred(event:Event):void
		{
			Config.volbgm = this.bgmVolume;
			Config.volsfx = this.sfxVolume;
			Assets.setup();
			this.closeDialog();
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
		
		private function modeFullscreen(e:TouchEvent):void{
			var touch:Touch = e.getTouch(this);
			if(!touch) return;
			if(touch.phase == TouchPhase.BEGAN){
				Starling.current.nativeStage.addEventListener(MouseEvent.MOUSE_UP, fullScreen);
			}
		}
		
		private function modeWindow(e:TouchEvent):void{
			var touch:Touch = e.getTouch(this);
			if(!touch) return;
			if(touch.phase == TouchPhase.BEGAN){
				Starling.current.nativeStage.addEventListener(MouseEvent.MOUSE_UP, window);
			}
		}
		
		private function fullScreen(e:MouseEvent):void{
			Starling.current.nativeStage.removeEventListener(MouseEvent.MOUSE_UP, fullScreen);
			Starling.current.nativeStage.displayState = StageDisplayState.FULL_SCREEN;	
			Config.mode = Option.STATE_FULLSCREEN;
		}
		
		private function window(e:MouseEvent):void
		{
			Starling.current.nativeStage.removeEventListener(MouseEvent.MOUSE_UP, window);
			Starling.current.nativeStage.displayState = StageDisplayState.NORMAL;
			Config.mode = Option.STATE_WINDOW;
		}
		
		private function onTouch(touch:TouchEvent):void
		{		
			
			if (touch.getTouch(buttonFacebook, TouchPhase.ENDED))
			{
				var request:URLRequest;
				request = new URLRequest("http://www.facebook.com/page/businesscareer");
				try {
					navigateToURL(request, '_blank');
				} catch (e:Error) {
					trace("Error occurred!"+e.message);
				}
			}
			
			if (touch.getTouch(buttonTwitter, TouchPhase.ENDED))
			{
				request = new URLRequest("http://www.twitter.com/businesscareer");
				try {
					navigateToURL(request, '_blank');
				} catch (e:Error) {
					trace("Error occurred!"+e.message);
				}
			}
			
			if (touch.getTouch(buttonPlusBgm, TouchPhase.ENDED))
			{
				if(bgmVolume<10){
					bgmVolume = bgmVolume+1;
					updateSetting();
				}				
			}
			if (touch.getTouch(buttonMinBgm, TouchPhase.ENDED))
			{
				if(bgmVolume>0){
					bgmVolume = bgmVolume-1;
					updateSetting();
				}				
			}
			
			if (touch.getTouch(buttonPlusSfx, TouchPhase.ENDED))
			{
				if(sfxVolume<10){
					sfxVolume = sfxVolume+1;
					updateSetting();
				}				
			}
			if (touch.getTouch(buttonMinSfx, TouchPhase.ENDED))
			{
				if(sfxVolume>0){
					sfxVolume = sfxVolume-1;
					updateSetting();
				}				
			}
			
			if (touch.getTouch(buttonConfirm, TouchPhase.ENDED))
			{
				Config.volbgm = volumeBgm;
				Config.volsfx = volumeSfx;
				Config.mode = screen;
			}
			
			if (touch.getTouch(buttonDiscard, TouchPhase.ENDED))
			{
				volumeBgm = Config.volbgm;
				volumeSfx = Config.volsfx;
				screen = Config.mode;
			}
			Assets.setup();
		}
		
		public function set sfxVolume(volume:uint):void
		{
			volumeSfx = volume;
		}
		
		public function get sfxVolume():uint
		{
			return volumeSfx;
		}
		
		public function set bgmVolume(volume:uint):void
		{
			volumeBgm = volume;
		}
		
		public function get bgmVolume():uint
		{
			return volumeBgm;
		}
		
		public function set screenState(state:String):void
		{
			screen = state;
		}
		
		public function get screenState():String
		{
			return screen;
		}
		
		public function updateSetting():void
		{		
			bgmVolumeBar.removeChildren();
			for(var i:uint = 0; i<bgmVolume; i++)
			{
				volumeValue = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("progress_option"));	
				volumeValue.x = (volumeValue.width + Config.XSMALL_GAP + 2) * i;
				bgmVolumeBar.addChild(volumeValue);
			}
			sfxVolumeBar.removeChildren();
			for(var j:uint = 0; j<sfxVolume; j++)
			{
				volumeValue = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("progress_option"));	
				volumeValue.x = (volumeValue.width + Config.XSMALL_GAP + 2) * j;
				sfxVolumeBar.addChild(volumeValue);
			}
		}
	}
}