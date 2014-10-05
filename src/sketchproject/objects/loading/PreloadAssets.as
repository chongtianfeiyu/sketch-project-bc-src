package sketchproject.objects.loading
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Elastic;
	
	import sketchproject.core.Assets;
		
	import sketchproject.managers.HazeManager;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.deg2rad;
	
	import sketchproject.utilities.Config;
	
	public class PreloadAssets extends Sprite
	{
		private var imagePreload:Image;
		private var screenCharLeft:Image;
		private var screenCharRight:Image;
		private var gameLogo:Image;
		
		public var hazeManager:HazeManager;
		public var hazeContainer:Sprite;
		private var loadingProgress:Sprite;
		
		private var starbrust:Starbrust;
		
		private var delayStarbrust:uint;
		private var delayMark:uint;
		private var delayLoading:uint;
		private var totalMark:uint;
		
		private var assetsLoadingText:TextField;
		private var assetsDetailText:TextField;
		
		private var loaderMark:Quad;
		
		private var typeAssets:uint;
		private var detailAssets:uint;
		
		private var loadingType:Array;
		private var loadingData:Array;
		
		private var loadingDone:Boolean;
		private var loadingClose:Boolean;
		
		
		public function PreloadAssets()
		{
			super();
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			imagePreload = new Image(Assets.getTexture("SpriteLoadingBackround"));
			addChild(imagePreload);
			
			starbrust = new Starbrust();
			starbrust.x = this.width * 0.5;
			starbrust.y = 150;
			addChild(starbrust);
			
			hazeContainer = new Sprite();
			addChild(hazeContainer);
			
			gameLogo = new Image(Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTexture("game_logo"));
			gameLogo.pivotX = gameLogo.width * 0.5;
			gameLogo.x = this.width * 0.5;
			gameLogo.y = 40;
			gameLogo.scaleX = 0.3;
			gameLogo.scaleY = 0.3;
			gameLogo.alpha = 0;
			addChild(gameLogo);
			
			screenCharLeft = new Image(Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTexture("screen_char_left"));
			screenCharLeft.pivotX = screenCharLeft.width * 0.5;
			screenCharLeft.x = 250;
			screenCharLeft.y = this.height + 20;
			screenCharLeft.scaleX = 0.7;
			screenCharLeft.scaleY = 0.7;
			addChild(screenCharLeft);
			
			screenCharRight = new Image(Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTexture("screen_char_right"));
			screenCharRight.pivotX = screenCharLeft.width * 0.5;
			screenCharRight.x = 740;
			screenCharRight.y = this.height + 20;
			screenCharRight.scaleX = 0.7;
			screenCharRight.scaleY = 0.7;
			addChild(screenCharRight);
			
			assetsLoadingText = new TextField(
				200, 
				50, 
				"Loading Assets", 
				Assets.getFont("FontSSPBold").fontName, 
				25, 
				0x333333
			);
			assetsLoadingText.x = this.width * 0.5 - assetsLoadingText.width * 0.5;
			assetsLoadingText.y = 420;
			addChild(assetsLoadingText);
			
			assetsDetailText = new TextField(
				200, 
				50, 
				"Background Menu Loading", 
				Assets.getFont("FontSSPRegular").fontName, 
				15, 
				0x555555
			);
			assetsDetailText.x = this.width * 0.5 - assetsDetailText.width * 0.5;
			assetsDetailText.y = 450;
			addChild(assetsDetailText);
			
			loadingProgress = new Sprite();
			for(var i:uint=0; i<4;i++)
			{
				loaderMark = new Quad(14,14,0x333333);	
				loaderMark.x = i * (loaderMark.width + 12);
				loadingProgress.addChild(loaderMark);
			}			
			loadingProgress.pivotX = loadingProgress.width * 0.5;
			loadingProgress.x = this.width * 0.5;
			loadingProgress.y = 500;
			loadingProgress.alpha = 0;
			loadingProgress.scaleX = 0.3;
			loadingProgress.scaleY = 0.3;
			addChild(loadingProgress);
			
			delayStarbrust = 0;
			delayMark = 0;
			totalMark = 0;
			
			typeAssets = 0;
			detailAssets = 0;
			
			loadingDone = false;
			loadingClose = false;
			
			loadingType = new Array();
			loadingType[0] = "Assets Loading";
			loadingType[1] = "Sounds Stream";
			loadingType[2] = "Script Data";
			
			loadingData = new Array();
			loadingData[0] = ["Background Menu Loading","City Isometric Loading"," Item List Loading", "UI Graphics Loading", "Preloading 100%", "Menu 100%", "Option 100%", "Head User Display 100%", "Map Navigation 100%"];
			loadingData[1] = ["SFX Sounds Loading","Environment Ambient","BGM Sounds Loading", "Channel Mixer 100%", "Track Loader 100%", "Byte Ambient Decoder 100%"];
			loadingData[2] = ["Prepare Menu Action", "Server Route Script", "Rule Based Game", "Pooling Object Script", "Blitting Image", "Particle Generator"];
			
			hazeManager = new HazeManager(this);
			
			this.alpha = 0;
		}
		
		public function startAnimate():void
		{			
			TweenMax.to(
				starbrust,
				0.3,
				{
					alpha:1, 
					scaleX:1, 
					scaleY:1
				}
			);
			
			TweenMax.to(
				gameLogo,
				0.5,
				{
					alpha:1, 
					scaleX:1, 
					scaleY:1, 
					ease:Elastic.easeOut, 
					delay:0.2
				}
			);
			
			TweenMax.to(
				screenCharLeft,
				0.5,
				{
					y:250, 
					scaleX:1, 
					scaleY:1, 
					ease:Elastic.easeOut, 
					delay:0.5
				}
			);
			
			TweenMax.to(
				screenCharRight,
				0.5,
				{
					y:250, 
					scaleX:1, 
					scaleY:1, 
					ease:Elastic.easeOut, 
					delay:1
				}
			);
			
			TweenMax.to(
				loadingProgress,
				0.5,
				{
					alpha:1,
					scaleX:1, 
					scaleY:1, 
					ease:Elastic.easeOut, 
					delay:0.5
				}
			);
			
		}
		
		public function closeAnimate():void
		{
			assetsLoadingText.removeFromParent(true);
			assetsDetailText.removeFromParent(true);
			
			TweenMax.to(
				screenCharLeft,
				1,
				{
					x:0,
					y:this.height + 20, 
					scaleX:1, 
					scaleY:1, 
					ease:Bounce.easeOut, 
					delay:0.5
				}
			);
			
			TweenMax.to(
				screenCharRight,
				1,
				{
					x:850,
					y:this.height + 20, 
					scaleX:1, 
					scaleY:1, 
					ease:Bounce.easeOut, 
					delay:1,
					onComplete:close
				}
			);
			
			TweenMax.to(
				gameLogo,
				1,
				{
					y:20,
					alpha:0, 
					scaleX:0.5, 
					scaleY:0.5, 
					ease:Back.easeIn, 
					delay:0.8
				}
			);
			
			TweenMax.to(
				loadingProgress,
				0.5,
				{
					alpha:0,
					scaleX:0.5, 
					scaleY:0.5, 
					ease:Back.easeIn,
					delay:0.3
				}
			);
			
			TweenMax.to(
				starbrust,
				0.3,
				{
					alpha:0, 
					scaleX:0.3, 
					scaleY:0.3,
					delay:1
				}
			);
			
			TweenMax.to(
				hazeContainer,
				0.5,
				{
					alpha:0,
					delay:0.8
				}
			);
		}
		
		private function close():void
		{
			closing = true;
		}
		
		public function set done(done:Boolean):void
		{
			this.loadingDone = done;
		}
		
		public function get done():Boolean
		{
			return loadingDone;
		}
		
		public function set closing(close:Boolean):void
		{
			this.loadingClose = close;
		}
		
		public function get closing():Boolean
		{
			return loadingClose;
		}
		
		public function update():void
		{
			delayStarbrust++;
			if(delayStarbrust == Config.DELAY_STARBRUST)
			{
				delayStarbrust = 0;
				starbrust.rotation += deg2rad(1);
			}
			
			if(!done)
			{
				delayLoading++;
				if(delayLoading == Config.DELAY_LOADING)
				{
					delayLoading = 0;
					assetsLoadingText.text = loadingType[typeAssets];
					if(detailAssets == loadingData[typeAssets].length)
					{
						typeAssets++;
						detailAssets = 0;
					}
					assetsDetailText.text = loadingData[typeAssets][detailAssets++];
					
					//trace(typeAssets+"   "+detailAssets);
					if(typeAssets == loadingType.length-1 && detailAssets == loadingData[loadingType.length-1].length)
					{						
						done = true;
						closeAnimate();
						//trace("DONE "+loadingDone);
					}
				}
				
				delayMark++;
				if(delayMark == Config.DELAY_COUNTER_MARK)
				{
					if(totalMark>0){
						loadingProgress.removeChildren(4, 4+totalMark);
					}
					
					if(totalMark == 4)
					{
						totalMark = 0;
					}
					else
					{
						totalMark++;
					}				
					
					for(var i:uint=0; i<totalMark;i++)
					{
						var mark:Quad = new Quad(10,10,0x5599CC);
						mark.x = loadingProgress.getChildAt(i).x + 2; 
						mark.y = loadingProgress.getChildAt(i).y + 2;
						loadingProgress.addChild(mark);
					}	
					
					
					delayMark = 0;
				}
				
				hazeManager.update();
			}			
			
			
		}
		
		public function destroy():void
		{
			hazeManager.destroy();
			delayLoading = 0;
			delayMark = 0;
			delayStarbrust = 0;
			loadingType= null;
			loadingData =null;			
		}
	}
}