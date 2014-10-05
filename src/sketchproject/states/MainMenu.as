package sketchproject.states
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	import com.greensock.easing.Linear;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.events.DialogBoxEvent;
	import sketchproject.interfaces.IState;
	import sketchproject.managers.FireworkManager;
	import sketchproject.managers.ServerManager;
	import sketchproject.objects.dialog.Help;
	import sketchproject.objects.dialog.Option;
	import sketchproject.utilities.Config;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class MainMenu extends Sprite implements IState
	{
		private var game:Game;
		
		private var background:Image;
		private var sun:Image;
		private var copyright:Image;
		private var logo:Image;
		private var credit:Image;
		
		private var buttonStart:Button;
		private var buttonOption:Button;
		private var buttonHelp:Button;
		private var buttonExit:Button;
		
		private var buttonFacebook:Button;
		private var buttonTwitter:Button;
		private var buttonCredit:Button;
		
		private var dialogOption:Option;
		private var dialogHelp:Help;
		
		private var fireworkManager:FireworkManager;
		
		public function MainMenu(game:Game)
		{			
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			initialize();	
			openTransition();			
			trace("STATE MAIN MENU");
		}
		
		public function initialize():void
		{
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			background = new Image(Assets.getTexture("SpriteMenuBackround"));
			background.alpha = 0;
			addChild(background);
			
			credit = new Image(Assets.getTexture("SpriteCreditTitle"));
			credit.x = 50;
			credit.y = Starling.current.nativeStage.stageHeight + Config.LARGE_GAP;
			addChild(credit);
			
			sun = new Image(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("sun"));
			sun.pivotX = sun.width * 0.5;
			sun.pivotY = sun.height * 0.5;
			sun.x = 680;
			sun.y = -100;
			addChild(sun);
			
			copyright = new Image(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("copyright"));
			copyright.pivotY = copyright.height;
			copyright.x = Config.XSMALL_GAP;
			copyright.y = Starling.current.stage.stageHeight + copyright.height;
			addChild(copyright);
			
			logo = new Image(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("game_logo"));
			logo.pivotX = logo.width * 0.5;
			logo.pivotY = logo.height * 0.5;
			logo.x = 850;
			logo.y = 100;
			logo.scaleX = 0;
			logo.scaleY = 0;
			logo.alpha = 0;
			addChild(logo);
			
			buttonStart = new Button(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("button_play"));
			buttonStart.pivotY = buttonStart.height * 0.5;
			buttonStart.alpha = 0;
			buttonStart.x = 0;
			buttonStart.y = 135;
			addChild(buttonStart);
						
			buttonOption = new Button(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("button_option"));
			buttonOption.pivotY = buttonOption.height * 0.5;
			buttonOption.alpha = 0;
			buttonOption.x = 0;
			buttonOption.y = buttonStart.y + buttonStart.height * 0.5 + Config.LARGE_GAP + Config.XSMALL_GAP;
			addChild(buttonOption);
			
			buttonHelp = new Button(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("button_help"));
			buttonHelp.pivotY = buttonHelp.height * 0.5;
			buttonHelp.alpha = 0;
			buttonHelp.x = 0;
			buttonHelp.y = buttonOption.y + buttonOption.height * 0.5 + Config.SMALL_GAP;
			addChild(buttonHelp);
			
			buttonExit = new Button(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("button_exit"));
			buttonExit.pivotY = buttonExit.height * 0.5;
			buttonExit.alpha = 0;
			buttonExit.x = 0;
			buttonExit.y = buttonHelp.y + buttonHelp.height * 0.5 + Config.XSMALL_GAP;
			addChild(buttonExit);
			
			buttonFacebook = new Button(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("button_facebook"));
			buttonFacebook.pivotX = buttonFacebook.width * 0.5;
			buttonFacebook.pivotY = buttonFacebook.height * 0.5;
			buttonFacebook.alpha = 0;
			buttonFacebook.x = 250;
			buttonFacebook.y = 470  + Config.XLARGE_GAP;
			addChild(buttonFacebook);
			
			buttonTwitter = new Button(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("button_twitter"));
			buttonTwitter.pivotX = buttonTwitter.width * 0.5;
			buttonTwitter.pivotY = buttonTwitter.height * 0.5;
			buttonTwitter.alpha = 0;
			buttonTwitter.x = buttonFacebook.x + buttonFacebook.width * 0.5 + Config.MEDIUM_GAP;
			buttonTwitter.y = buttonFacebook.y - 30 + Config.XLARGE_GAP;
			addChild(buttonTwitter);
			
			buttonCredit = new Button(Assets.getAtlas("AtlasTextureMenu", "AtlasMenuXML").getTexture("button_credit"));
			buttonCredit.pivotX = buttonCredit.width * 0.5;
			buttonCredit.pivotY = buttonCredit.height * 0.5;
			buttonCredit.alpha = 0;
			buttonCredit.x = buttonTwitter.x + buttonTwitter.width * 0.5 + Config.MEDIUM_GAP;
			buttonCredit.y = buttonTwitter.y - Config.MEDIUM_GAP  + Config.XLARGE_GAP;
			addChild(buttonCredit);
			
			dialogOption = new Option();
			dialogOption.x = stage.stageWidth * 0.5;
			dialogOption.y = stage.stageHeight * 0.5;
			addChild(dialogOption);
			
			dialogHelp = new Help();
			dialogHelp.x = stage.stageWidth * 0.5;
			dialogHelp.y = stage.stageHeight * 0.5;				
			addChild(dialogHelp);
			
			addEventListener(TouchEvent.TOUCH, onTouch);	
		}
		
		
		private function onTouch(touch:TouchEvent):void
		{	
			Assets.setup();
			var request:URLRequest;
			
			if (touch.getTouch(buttonStart, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				closeTransition();
				Assets.sfxChannel = Assets.sfxClick.play();
			}
			
			if (touch.getTouch(buttonOption, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				
				dialogOption.openDialog();
				
				Assets.sfxChannel = Assets.sfxClick.play();		
				
				//trace("Volume "+Assets.bgmChannel.soundTransform.volume);
			}
			
			if (touch.getTouch(buttonHelp, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				
				dialogHelp.openDialog();
				
				Assets.sfxChannel = Assets.sfxClick.play();
			}
			
			if (touch.getTouch(buttonExit, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				request = new URLRequest(ServerManager.SERVER_HOST);
				try {
					navigateToURL(request, '_self');
				} catch (e:Error) {
					trace("Error occurred!"+e.message);
				}
				Assets.sfxChannel = Assets.sfxClick.play();
			}
			
			if (touch.getTouch(buttonFacebook, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				request = new URLRequest("http://www.facebook.com/page/businesscareer");
				try {
					navigateToURL(request, '_blank');
				} catch (e:Error) {
					trace("Error occurred!"+e.message);
				}
				Assets.sfxChannel = Assets.sfxClick.play();
			}
			if (touch.getTouch(buttonTwitter, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				request = new URLRequest("http://www.twitter.com/businesscareer");
				try {
					navigateToURL(request, '_blank');
				} catch (e:Error) {
					trace("Error occurred!"+e.message);
				}
				Assets.sfxChannel = Assets.sfxClick.play();
			}
			if (touch.getTouch(buttonCredit, TouchPhase.ENDED))
			{
				copyright.visible = false;
				buttonStart.visible=false;
				buttonOption.visible=false;
				buttonHelp.visible=false;
				buttonExit.visible=false;
				buttonFacebook.visible = false;
				buttonTwitter.visible = false;
				buttonCredit.visible = false;
				creditSlideUp();
				Assets.sfxChannel = Assets.sfxClick.play();
			}
			
		}
		
		private function creditSlideUp():void
		{
			TweenMax.to(
				credit,
				35,
				{
					ease:Linear.easeNone,
					y:-credit.height + Config.LARGE_GAP,
					onComplete:creditSlideDown
				}
			);
		}
		
		private function creditSlideDown():void
		{
			copyright.visible = true;
			buttonStart.visible=true;
			buttonOption.visible=true;
			buttonHelp.visible=true;
			buttonExit.visible=true;
			buttonFacebook.visible = true;
			buttonTwitter.visible = true;
			buttonCredit.visible = true;
			credit.y = Starling.current.nativeStage.stageHeight + Config.LARGE_GAP;
		}
		
		private function openTransition():void
		{
			TweenMax.to(
				background,
				1,
				{
					alpha:1,
					delay:0.3
				}
			);
			
			TweenMax.to(
				logo,
				1,
				{
					scaleX:0.6,
					scaleY:0.6,
					alpha:1,
					ease:Back.easeOut,
					delay:2.5
				}
			);
			
			TweenMax.to(
				sun,
				1,
				{
					x:680,
					y:80,
					alpha:1,
					ease:Back.easeOut,
					delay:1.8
				}
			);
			
			TweenMax.to(
				copyright,
				1,
				{
					y:Starling.current.stage.stageHeight + Config.SMALL_GAP,
					alpha:1,
					ease:Back.easeOut,
					delay:0.7
				}
			);
			
			TweenMax.to(
				buttonStart,
				0.5,
				{
					x:130,
					alpha:1,
					ease:Back.easeOut,
					delay:1
				}
			);
			
			TweenMax.to(
				buttonStart,
				0.5,
				{
					x:130,
					alpha:1,
					ease:Back.easeOut,
					delay:1
				}
			);
			
			TweenMax.to(
				buttonOption,
				0.5,
				{
					x:160,
					alpha:1,
					ease:Back.easeOut,
					delay:1.4
				}
			);
			
			TweenMax.to(
				buttonHelp,
				0.5,
				{
					x:170,
					alpha:1,
					ease:Back.easeOut,
					delay:1.8
				}
			);
			
			TweenMax.to(
				buttonExit,
				0.5,
				{
					x:180,
					alpha:1,
					ease:Back.easeOut,
					delay:2.2
				}
			);
			
			TweenMax.to(
				buttonFacebook,
				0.3,
				{
					y:470,
					alpha:1,
					ease:Back.easeOut,
					delay:2.2
				}
			);
			
			TweenMax.to(
				buttonTwitter,
				0.3,
				{
					y:440,
					alpha:1,
					ease:Back.easeOut,
					delay:2.4
				}
			);
			
			TweenMax.to(
				buttonCredit,
				0.3,
				{
					y:410,
					alpha:1,
					ease:Back.easeOut,
					delay:2.6
				}
			);
			
		}
		
		private function closeTransition():void
		{
			TweenMax.to(
				buttonCredit,
				0.3,
				{
					y:410+Config.XLARGE_GAP,
					alpha:0,
					ease:Back.easeOut
				}
			);
			
			TweenMax.to(
				buttonTwitter,
				0.3,
				{
					y:440+Config.XLARGE_GAP,
					alpha:0,
					ease:Back.easeOut,
					delay:0.2
				}
			);
			
			TweenMax.to(
				buttonFacebook,
				0.3,
				{
					y:470+Config.XLARGE_GAP,
					alpha:0,
					ease:Back.easeOut,
					delay:0.4
				}
			);
			
			TweenMax.to(
				buttonStart,
				0.4,
				{
					x:130+Config.XXLARGE_GAP,
					alpha:0,
					ease:Back.easeOut
				}
			);
			
			TweenMax.to(
				buttonOption,
				0.4,
				{
					x:160+Config.XXLARGE_GAP,
					alpha:0,
					ease:Back.easeOut,
					delay:0.1
				}
			);
			
			TweenMax.to(
				buttonHelp,
				0.4,
				{
					x:170+Config.XXLARGE_GAP,
					alpha:0,
					ease:Back.easeOut,
					delay:0.2
				}
			);
			
			TweenMax.to(
				buttonExit,
				0.4,
				{
					x:180+Config.XXLARGE_GAP,
					alpha:0,
					ease:Back.easeOut,
					delay:0.3
				}
			);
			
			
			TweenMax.to(
				logo,
				1,
				{
					scaleX:0,
					scaleY:0,
					alpha:0,
					ease:Back.easeOut,
					delay:0.4
				}
			);
			
			TweenMax.to(
				sun,
				1,
				{
					alpha:0,
					delay:0.2
				}
			);
			
			TweenMax.to(
				copyright,
				0.4,
				{
					y:Starling.current.stage.stageHeight + copyright.height,
					alpha:0,
					ease:Back.easeOut,
					delay:0.4
				}
			);
			
			TweenMax.to(
				background,
				0.5,
				{
					alpha:0,
					delay:0.6,
					onComplete:changeState
				}
			);
		}
		
		private function changeState():void
		{
			if(Config.prepare)
			{
				game.changeState(Game.PLAY_STATE);
			}
			else
			{
				game.changeState(Game.PARAMETER_STATE);
			}			
		}
						
		public function update():void
		{
			if(sun.x > -sun.width)
			{
				sun.x-=0.1;
			}
			else
			{
				sun.x = Starling.current.nativeStage.stageWidth + sun.width;	
			}
		}
		
		public function destroy():void
		{
			removeEventListener(TouchEvent.TOUCH, onTouch);
			
			fireworkManager.destroy();
			
			background.removeFromParent(true)
			background = null;
			sun.removeFromParent(true)
			sun = null;
			copyright.removeFromParent(true)
			copyright = null;
			logo.removeFromParent(true)
			logo = null;
			credit.removeFromParent(true)
			credit = null;
			
			buttonStart.removeFromParent(true)
			buttonStart = null;
			buttonOption.removeFromParent(true)
			buttonOption = null;
			buttonHelp.removeFromParent(true)
			buttonHelp = null;
			buttonExit.removeFromParent(true)
			buttonExit = null;
			
			buttonFacebook.removeFromParent(true)
			buttonFacebook = null;
			buttonTwitter.removeFromParent(true)
			buttonTwitter = null;
			buttonCredit.removeFromParent(true)
			buttonCredit = null;
		}
	}
}