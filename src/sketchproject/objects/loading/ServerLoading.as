package sketchproject.objects.loading
{
	import sketchproject.core.Assets;
		
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class ServerLoading extends Sprite
	{
		private var communicationType:uint;
	
		private var background:Quad;
		
		private var mcExclamation:MovieClip;
		private var mcLoadingBar:MovieClip;
		
		public static const SERVER_EXCLAMATION:uint = 0;
		public static const SERVER_PROGRESS:uint = 1;
		
		private var textTitle:TextField;
		private var textSubtitle:TextField;
		
		private var title:String;
		private var sub:String;
		
		public function ServerLoading(type:uint = 0, titleMessage:String = "Check", subMessage:String = "Loading")
		{
			super();
			communicationType = type;
			title = titleMessage;
			sub = subMessage;
			
			initObjectProperty();			
		}
		
		public function initObjectProperty():void
		{			
			background = new Quad(
				Starling.current.nativeStage.stageWidth, 
				Starling.current.nativeStage.stageHeight,
				0xAAAAAA
			);
			addChild(background);
			
			if(communicationType == SERVER_EXCLAMATION)
			{
				mcExclamation = new MovieClip(
					Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTextures("exclamation_server"),
					10
				);
				
				mcExclamation.pivotX = mcExclamation.width * 0.5;
				mcExclamation.x = this.width * 0.5;
				mcExclamation.y = 175;
				Starling.juggler.add(mcExclamation);	
				addChild(mcExclamation);
			}
			else if(communicationType == SERVER_PROGRESS)
			{
				mcLoadingBar = new MovieClip(
					Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTextures("strip_loading"),
					10
				);
				mcLoadingBar.pivotX = mcLoadingBar.width * 0.5;
				mcLoadingBar.x = this.width * 0.5;
				mcLoadingBar.y = 225;
				Starling.juggler.add(mcLoadingBar);
				addChild(mcLoadingBar);
			}
			
			textTitle = new TextField(
				300,
				50,
				title, 
				Assets.getFont("FontSSPBold").fontName,
				25,
				0xE0DFDD,
				true
			);
			textTitle.pivotX = textTitle.width * 0.5;
			textTitle.x = this.width * 0.5;
			textTitle.y = 260;
			
			textSubtitle = new TextField(
				550, 
				100, 
				sub, 
				Assets.getFont("FontSSPBold").fontName, 
				15, 
				0x454545, 
				true
			);
			textSubtitle.pivotX = textSubtitle.width * 0.5;
			textSubtitle.x = this.width * 0.5;
			textSubtitle.y = 270;
			
			addChild(textTitle);
			addChild(textSubtitle);
			
		}
		
		public function updateInfo(titleMessage:String = "Check", subMessage:String = "Loading"):void
		{
			textTitle.text = titleMessage;
			textSubtitle.text = subMessage
		}
		
		public function destroy():void
		{
			title = null;
			sub = null;
			mcExclamation = null;
			mcLoadingBar = null;
			textTitle = null;
			textSubtitle = null;
			removeFromParent(true);
		}
		
	}
}