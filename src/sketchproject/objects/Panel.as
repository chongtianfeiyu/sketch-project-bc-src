package sketchproject.objects
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
	import starling.textures.Texture;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class Panel extends Sprite implements IDialog
	{
		private var overlay:Quad;
		private var dialogBase:Image;
		private var dialogIcon:Image;
		private var dialogTitle:Image;
		private var dialogSubtitle:TextField;
		private var buttonClose:Button;
		private var fireworkManager:FireworkManager;
		
		public function Panel(iconTexture:Texture, titleTexture:Texture, subtitle:String)
		{
			super();
			
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.8;	
			overlay.color = 0x000000;
			addChild(overlay);
			
			dialogBase = new Image(Assets.getAtlas(Assets.TEXTURE_PANEL, Assets.TEXTURE_PANEL_XML).getTexture("panel"));
			dialogBase.pivotX = dialogBase.width * 0.5;
			dialogBase.pivotY = dialogBase.height * 0.5;
			addChild(dialogBase);
			
			dialogIcon = new Image(iconTexture);
			dialogIcon.pivotX = dialogIcon.width * 0.5;
			dialogIcon.pivotY = dialogIcon.height * 0.5;
			dialogIcon.x = -421.45;
			dialogIcon.y = -241.8;
			addChild(dialogIcon);
			
			dialogTitle = new Image(titleTexture);
			dialogTitle.x = -380.45;
			dialogTitle.y = -280;
			dialogTitle.scaleX = 0.9;
			dialogTitle.scaleY = 0.9;
			addChild(dialogTitle);
			
			dialogSubtitle = new TextField(300, 35, subtitle, Assets.getFont("FontCarterOne").fontName, 18, 0xFFFFFF);			
			dialogSubtitle.x = -380.45;
			dialogSubtitle.y = -242;
			dialogSubtitle.hAlign = HAlign.LEFT;
			dialogSubtitle.vAlign = VAlign.TOP;
			addChild(dialogSubtitle);
			
			buttonClose = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_cross"));
			buttonClose.pivotX = buttonClose.width * 0.5;
			buttonClose.pivotY = buttonClose.height * 0.5;
			buttonClose.scaleX = 0.9;
			buttonClose.scaleY = 0.9;
			buttonClose.y = -240;
			buttonClose.x = 454.75;
			addChild(buttonClose);
			
			buttonClose.addEventListener(Event.TRIGGERED, onPrimaryTrigerred);
			
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
		
		public function onPrimaryTrigerred(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			closeDialog();
		}
		
		public function onSecondaryTrigerred(event:Event):void
		{
			// nothing
		}
	}
}