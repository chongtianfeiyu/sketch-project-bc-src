package sketchproject.objects.dialog
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.events.DialogBoxEvent;
	import sketchproject.interfaces.IDialog;
	import sketchproject.managers.FireworkManager;
	import sketchproject.managers.ServerManager;
	import sketchproject.states.Play;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Pause extends Sprite
	{
		private var overlay:Quad;
		private var background:Image;
		private var buttonResume:Button;
		private var buttonOption:Button;
		private var buttonMenu:Button;
		private var buttonLogout:Button;
		
		private var dialogOption:Option;
		private var dialogBack:NativeDialog = new NativeDialog(NativeDialog.DIALOG_QUESTION, "Back To Menu", "Do you want back to Menu?");
		private var dialogLogout:NativeDialog = new NativeDialog(NativeDialog.DIALOG_QUESTION, "Logout Confirmation", "Are you sure sign out now?");
				
		private var game:Game;
		
		private var fireworkManager:FireworkManager;
		
		public function Pause(game:Game, dialogOption:Option)
		{
			super();			
			
			this.game = game;
			this.dialogOption = dialogOption;
			
			fireworkManager = new FireworkManager(Game.overlayStage);
			
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
			
			background = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("dialog_pause"));
			background.pivotX = background.width * 0.5;
			background.pivotY = background.height * 0.5;
			addChild(background);
			
			buttonResume = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_resume"));
			buttonResume.pivotX = buttonResume.width * 0.5;
			buttonResume.pivotY = buttonResume.height * 0.5;
			buttonResume.y = -70;
			addChild(buttonResume);
			
			buttonOption = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_option"));
			buttonOption.pivotX = buttonResume.width * 0.5;
			buttonOption.pivotY = buttonResume.height * 0.5;
			buttonOption.y = 10;
			addChild(buttonOption);
			
			buttonMenu = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_menu"));
			buttonMenu.pivotX = buttonResume.width * 0.5;
			buttonMenu.pivotY = buttonResume.height * 0.5;
			buttonMenu.y = 90;
			addChild(buttonMenu);
			
			buttonLogout = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_logout"));
			buttonLogout.pivotX = buttonResume.width * 0.5;
			buttonLogout.pivotY = buttonResume.height * 0.5;
			buttonLogout.y = 170;
			addChild(buttonLogout);
			
			buttonResume.addEventListener(Event.TRIGGERED, onPrimaryTrigerred);
			buttonOption.addEventListener(Event.TRIGGERED, onOption);
			buttonMenu.addEventListener(Event.TRIGGERED, onMenu);
			buttonLogout.addEventListener(Event.TRIGGERED, onLogout);
						
			dialogBack.addEventListener(DialogBoxEvent.CLOSED, onMenuDialogClosed);
			addChild(dialogBack);
						
			dialogLogout.addEventListener(DialogBoxEvent.CLOSED, onLogoutDialogClosed);
			addChild(dialogLogout);
						
			scaleX = 0.5;
			scaleY = 0.5;
			alpha = 0;
			visible = false;
		}
		
		private function onSecondaryTrigerred(event:Event):void
		{
			// nothing
		}
		
		private function onPrimaryTrigerred(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			closeDialog();
		}
		
		private function onOption(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			dialogOption.openDialog();
		}
		
		private function onMenu(event:Event):void
		{	
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);			
			dialogBack.openDialog();			
		}
		
		private function onLogout(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);			
			dialogLogout.openDialog();			
		}

		private function onMenuDialogClosed(event:DialogBoxEvent):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			if(event.result)
			{
				// primary action
				closeDialog();
				game.changeState(Game.MENU_STATE);
			}	
			else
			{
				// secondary action	
				dialogBack.closeDialog();
			}
		}
		
		private function onLogoutDialogClosed(event:DialogBoxEvent):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			if(event.result)
			{
				// primary action
				var request:URLRequest = new URLRequest(ServerManager.SERVER_HOST+"/player/logout");
				try {
					closeDialog();
					navigateToURL(request, '_self');
				} catch (e:Error) {
					trace("Error occurred!"+e.message);
				}
			}
			else
			{
				// secondary action	
				dialogLogout.closeDialog();
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
		
	}
}