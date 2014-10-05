package sketchproject.objects.dialog
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.interfaces.IDialog;
	import sketchproject.managers.FireworkManager;
	import sketchproject.objects.list.LeaderboardAdapter;
	import sketchproject.utilities.Config;
	import sketchproject.utilities.ValueFormat;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class Leaderboard extends Sprite implements IDialog
	{
		private var overlay:Quad;
		private var dialogBase:Image;
		private var dialogTitle:Image;
		private var buttonClose:Button;
		private var fireworkManager:FireworkManager;
		
		private var textMyScore:TextField;
		private var textMyName:TextField;
		private var textMyPosition:TextField;
		
		private var avatarBase:Image;
		
		public function Leaderboard()
		{
			super();
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.8;	
			overlay.color = 0x000000;
			addChild(overlay);
			
			dialogBase = new Image(Assets.getAtlas(Assets.TEXTURE_PANEL, Assets.TEXTURE_PANEL_XML).getTexture("panel_light"));
			dialogBase.pivotX = dialogBase.width * 0.5;
			dialogBase.pivotY = dialogBase.height * 0.5;
			addChild(dialogBase);
			
			dialogTitle = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("title_leaderboard"));
			dialogTitle.pivotX = dialogTitle.width * 0.5;
			dialogTitle.pivotY = dialogTitle.height * 0.5;
			dialogTitle.y = -240;
			addChild(dialogTitle);
			
			buttonClose = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_ok"));
			buttonClose.pivotX = buttonClose.width * 0.5;
			buttonClose.pivotY = buttonClose.height * 0.5;
			buttonClose.scaleX = 0.9;
			buttonClose.scaleY = 0.9;
			buttonClose.y = 230;
			addChild(buttonClose);
			
			buttonClose.addEventListener(Event.TRIGGERED, onPrimaryTrigerred);
			
			avatarBase = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("avatar_wrapper"));
			avatarBase.x = -200;
			avatarBase.y = -200;
			addChild(avatarBase);
			
			textMyPosition = new TextField(300, 35, "You at 25th Position", Assets.getFont("FontSSPRegular").fontName, 22, 0xBC8458);			
			textMyPosition.x = -135;
			textMyPosition.y = -203;
			textMyPosition.hAlign = HAlign.LEFT;
			textMyPosition.vAlign = VAlign.TOP;
			addChild(textMyPosition);
			
			textMyPosition = new TextField(300, 35, "Global World Ranking", Assets.getFont("FontSSPRegular").fontName, 18, 0xBC8458);;
			textMyPosition.x = -135;
			textMyPosition.y = -178;
			textMyPosition.hAlign = HAlign.LEFT;
			textMyPosition.vAlign = VAlign.TOP;
			addChild(textMyPosition);
			
			textMyScore = new TextField(300, 35, ValueFormat.format(Config.point)+" PTS", Assets.getFont("FontSSPRegular").fontName, 23, 0xBC8458);;
			textMyScore.pivotX = textMyScore.width;
			textMyScore.x = 200;
			textMyScore.y = -203;
			textMyScore.hAlign = HAlign.RIGHT;
			textMyScore.vAlign = VAlign.TOP;
			addChild(textMyScore);
			
			var star:Image;
			for(var i:uint = 0 ;i<5; i++)
			{
				if(i<Config.stars)
				{
					star = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("star"));					
				}
				else
				{
					star = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("star_base"));
				}
				star.x = (i * (star.width + 5)) + 102.8;
				star.y = -170;
				addChild(star);				
			}
			
			scaleX = 0.5;
			scaleY = 0.5;
			alpha = 0;
			visible = false;
			
			for(var j:uint = 0 ;j<5;j++)
			{
				var leader:LeaderboardAdapter= new LeaderboardAdapter();
				leader.leaderPlayer = "Angga Ari Wijaya";
				leader.leaderOrder = (j+1);
				leader.leaderStar = 3;
				leader.leaderScore = Math.floor(Math.random() * 1000);
				leader.setup();
				leader.x = -215;
				leader.y = (j*(leader.height+2))-130;
				addChild(leader);
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