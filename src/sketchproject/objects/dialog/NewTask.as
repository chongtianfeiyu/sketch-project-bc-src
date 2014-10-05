package sketchproject.objects.dialog
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.interfaces.IDialog;
	import sketchproject.managers.FireworkManager;
	import sketchproject.objects.TaskIcon;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class NewTask extends Sprite implements IDialog
	{
		private var overlay:Quad;
		private var dialogBase:Image;
		private var dialogIcon:TaskIcon;
		private var info:TextField;
		private var buttonOK:Button;
		private var fireworkManager:FireworkManager;
		
		public function NewTask(textInfo:String, type:String, point:uint)
		{
			super();
			
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.8;	
			overlay.color = 0x000000;
			addChild(overlay);
			
			dialogBase = new Image(Assets.getAtlas(Assets.TEXTURE_PANEL, Assets.TEXTURE_PANEL_XML).getTexture("dialog_new_task"));
			dialogBase.pivotX = dialogBase.width * 0.5;
			dialogBase.pivotY = dialogBase.height * 0.5;
			addChild(dialogBase);
			
			dialogIcon = new TaskIcon(type);
			dialogIcon.y = -80;
			addChild(dialogIcon);
			
			info = new TextField(250, 150, textInfo, Assets.getFont("FontCarterOne").fontName, 16, 0xFFFFFF);
			info.pivotX = info.width * 0.5;
			info.y = -40;
			info.vAlign = VAlign.TOP;
			addChild(info);
			
			info = new TextField(250, 150, "Reward", Assets.getFont("FontCarterOne").fontName, 12, 0xFFFFFF);
			info.x = -100;
			info.y = 22;
			info.hAlign = HAlign.LEFT;
			info.vAlign = VAlign.TOP;
			addChild(info);
			
			info = new TextField(250, 150, point+" PTS", Assets.getFont("FontCarterOne").fontName, 15, 0xFFFFFF);
			info.x = -100;
			info.y = 37;
			info.hAlign = HAlign.LEFT;
			info.vAlign = VAlign.TOP;
			addChild(info);
			
			info = new TextField(250, 150, "Progress", Assets.getFont("FontCarterOne").fontName, 12, 0xFFFFFF);
			info.pivotX = info.width;
			info.x = 100;
			info.y = 22;			
			info.hAlign = HAlign.RIGHT;
			info.vAlign = VAlign.TOP;
			addChild(info);
			
			info = new TextField(250, 150, "1/1", Assets.getFont("FontCarterOne").fontName, 15, 0xFFFFFF);
			info.pivotX = info.width;
			info.x = 100;
			info.y = 37;
			info.hAlign = HAlign.RIGHT;
			info.vAlign = VAlign.TOP;
			addChild(info);
			
			buttonOK = new Button(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("button_confirm"));
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
						fireworkManager.spawn(Game.overlayStage.width * 0.5, Game.overlayStage.height * 0.5 - 50);
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