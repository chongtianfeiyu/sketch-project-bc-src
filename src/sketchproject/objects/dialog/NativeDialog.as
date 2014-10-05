package sketchproject.objects.dialog
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.events.DialogBoxEvent;
	import sketchproject.managers.FireworkManager;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class NativeDialog extends Sprite
	{
		public static const DIALOG_CONFIRM:String = "confirm"; // ok cancel button
		public static const DIALOG_QUESTION:String = "question"; // yes no button
		public static const DIALOG_INFORMATION:String = "information"; // ok button
		public static const DIALOG_CLOSE:String = "close"; // close button
		
		private var overlay:Quad;
		private var dialogBase:Image;
		private var buttonPrimary:Button;
		private var buttonSecondary:Button;
		
		private var textTitle:TextField;
		private var textMessage:TextField;
		
		private var fireworkManager:FireworkManager;
		
		public function NativeDialog(type:String = DIALOG_INFORMATION, title:String = "No Title", message:String = "No Message")
		{
			super();
			
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.8;	
			overlay.color = 0x000000;
			addChild(overlay);
			
			dialogBase = new Image(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("dialog_custom"));
			dialogBase.pivotX = dialogBase.width * 0.5;
			dialogBase.pivotY = dialogBase.height * 0.5;
			addChild(dialogBase);
			
			textTitle = new TextField(450,100,title, "Carter",38, 0xFFFFFF);
			textTitle.pivotX = textTitle.width * 0.5;
			textTitle.pivotY = textTitle.height * 0.5;
			textTitle.x = 0;
			textTitle.y = -75;			
			addChild(textTitle);
			
			textMessage = new TextField(450,100,message, "Carter",30, 0xFFFFFF);
			textMessage.pivotX = textMessage.width * 0.5;
			textMessage.pivotY = textMessage.height * 0.5;
			textMessage.x = 0;
			textMessage.y = 10;
			addChild(textMessage);
			
			buttonPrimary = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_yes"));
			buttonPrimary.pivotX = buttonPrimary.width * 0.5;
			buttonPrimary.pivotY = buttonPrimary.height * 0.5;
			buttonPrimary.x = -80;
			buttonPrimary.y = 100;
			addChild(buttonPrimary);
			
			buttonSecondary = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_no"));
			buttonSecondary.pivotX = buttonSecondary.width * 0.5;
			buttonSecondary.pivotY = buttonSecondary.height * 0.5;
			buttonSecondary.x = 80;
			buttonSecondary.y = 100;
			addChild(buttonSecondary);
			
			buttonPrimary.addEventListener(Event.TRIGGERED, onPrimaryTrigerred);
			buttonSecondary.addEventListener(Event.TRIGGERED, onSecondaryTrigerred)
			
			scaleX = 0.5;
			scaleY = 0.5;
			alpha = 0;
			visible = false;
		}
		
		private function onSecondaryTrigerred(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			dispatchEvent(new DialogBoxEvent(DialogBoxEvent.CLOSED, false));
		}
		
		private function onPrimaryTrigerred(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			dispatchEvent(new DialogBoxEvent(DialogBoxEvent.CLOSED, true));
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