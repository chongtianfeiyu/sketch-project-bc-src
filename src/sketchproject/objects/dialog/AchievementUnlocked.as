package sketchproject.objects.dialog
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.interfaces.IDialog;
	import sketchproject.managers.FireworkManager;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.VAlign;
	
	public class AchievementUnlocked extends Sprite implements IDialog
	{
		private var overlay:Quad;
		private var dialogBase:Image;
		private var dialogIcon:Image;
		private var info:TextField;
		private var buttonOK:Button;
		private var fireworkManager:FireworkManager;
		
		public function AchievementUnlocked(textInfo:String, achievementIcon:String)
		{
			super();
			
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.8;	
			overlay.color = 0x000000;
			addChild(overlay);
			
			dialogBase = new Image(Assets.getAtlas(Assets.TEXTURE_PANEL, Assets.TEXTURE_PANEL_XML).getTexture("dialog_new_congratulation"));
			dialogBase.pivotX = dialogBase.width * 0.5;
			dialogBase.pivotY = dialogBase.height * 0.5;
			addChild(dialogBase);
			
			dialogIcon = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture(achievementIcon));
			dialogIcon.pivotX = dialogIcon.width * 0.5;
			dialogIcon.pivotY = dialogIcon.height * 0.5;
			dialogIcon.y = -100;
			dialogIcon.scaleX = 0.8;
			dialogIcon.scaleY = 0.8;
			addChild(dialogIcon);
			
			dialogIcon = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("icon_achievement_unlocked"));
			dialogIcon.pivotX = dialogIcon.width * 0.5;
			dialogIcon.pivotY = dialogIcon.height * 0.5;
			dialogIcon.y = -20;
			addChild(dialogIcon);
			
			info = new TextField(250, 150, textInfo, Assets.getFont("FontCarterOne").fontName, 17, 0xFFFFFF);
			info.pivotX = info.width * 0.5;
			info.y = 10;
			info.vAlign = VAlign.TOP;
			addChild(info);
			
			buttonOK = new Button(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("button_ok"));
			buttonOK.pivotX = buttonOK.width * 0.5;
			buttonOK.pivotY = buttonOK.height * 0.5;
			buttonOK.scaleX = 0.75;
			buttonOK.scaleY = 0.75;
			buttonOK.y = 100;
			addChild(buttonOK);
			
			buttonOK.addEventListener(Event.TRIGGERED, onPrimaryTrigerred);
			
			scaleX = 0.5;
			scaleY = 0.5;
			alpha = 0;
			visible = false;
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
					delay:1,
					onComplete:function():void{
						fireworkManager.spawn(0, -30);
					}
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
		
		public function onPrimaryTrigerred(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			closeDialog();
		}
		
		public function onSecondaryTrigerred(event:Event):void
		{
		}
	}
}