package sketchproject.core
{
	import flash.display.Bitmap;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.text.Font;
	import flash.utils.Dictionary;
	
	import sketchproject.objects.dialog.Option;
	import sketchproject.utilities.Config;
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		// graphics assets
		[Embed(source="assets/graphics/splash/loading_background.png")]
		private static var SpriteLoadingBackround:Class;
		
		[Embed(source="assets/graphics/menu/menu_background.png")]
		private static var SpriteMenuBackround:Class;
		
		[Embed(source="assets/graphics/menu/credit_title.png")]
		private static var SpriteCreditTitle:Class;
		
		[Embed(source="assets/graphics/hud/quick_help.png")]
		private static var SpriteQuickHelp:Class;
		
		[Embed(source="assets/graphics/menu/MenuAtlas.png")]
		public static const AtlasTextureMenu:Class;
		
		[Embed(source="assets/graphics/menu/MenuAtlas.xml", mimeType="application/octet-stream")]
		public static const AtlasMenuXML:Class;
		
		[Embed(source="assets/graphics/menu/DialogAtlas.png")]
		public static const AtlasTextureDialog:Class;
		
		[Embed(source="assets/graphics/menu/DialogAtlas.xml", mimeType="application/octet-stream")]
		public static const AtlasDialogXML:Class;
		
		[Embed(source="assets/graphics/menu/ParameterAtlas.png")]
		public static const AtlasTextureParameter:Class;
		
		[Embed(source="assets/graphics/menu/ParameterAtlas.xml", mimeType="application/octet-stream")]
		public static const AtlasParameterXML:Class;
		
		[Embed(source="assets/graphics/hud/HUDAtlas.png")]
		public static const AtlasHUD:Class;
		
		[Embed(source="assets/graphics/hud/HUDAtlas.xml", mimeType="application/octet-stream")]
		public static const AtlasHUDXML:Class;
		
		[Embed(source="assets/graphics/menu/AchievementAtlas.png")]
		public static const AtlasAchievement:Class;
		
		[Embed(source="assets/graphics/menu/AchievementAtlas.xml", mimeType="application/octet-stream")]
		public static const AtlasAchievementXML:Class;
		
		[Embed(source="assets/graphics/menu/PanelAtlas.png")]
		public static const AtlasPanel:Class;
		
		[Embed(source="assets/graphics/menu/PanelAtlas.xml", mimeType="application/octet-stream")]
		public static const AtlasPanelXML:Class;
		
		[Embed(source="assets/graphics/menu/ContentAtlas.png")]
		public static const AtlasContent:Class;
		
		[Embed(source="assets/graphics/menu/ContentAtlas.xml", mimeType="application/octet-stream")]
		public static const AtlasContentXML:Class;
		
		[Embed(source="assets/graphics/city/MapAtlas.png")]
		public static const AtlasMap:Class;
		
		[Embed(source="assets/graphics/city/MapAtlas.xml", mimeType="application/octet-stream")]
		public static const AtlasMapXML:Class;
		
		
		// particle assets
		[Embed(source="assets/particles/fireworks.png")]
		private static var ParticleFireworks:Class;
		
		[Embed(source="assets/particles/fireworks.pex", mimeType="application/octet-stream")]
		public static var ParticleFireworksXML:Class;
		
		
		// fonts assets
		//[Embed(source="assets/fonts/komika.png")]
		//private static var Komika:Class;
		
		//[Embed(source="assets/fonts/komika.fnt", mimeType="application/octet-stream")]
		//private static var KomikaXML:Class;
		
		[Embed(source="assets/fonts/carter.png")]
		private static var Carter:Class;
		
		[Embed(source="assets/fonts/carter.fnt", mimeType="application/octet-stream")]
		private static var CarterXML:Class;
		
		[Embed(source="assets/fonts/carterdark.png")]
		private static var Carterdark:Class;
		
		[Embed(source="assets/fonts/carterdark.fnt", mimeType="application/octet-stream")]
		private static var CarterdarkXML:Class;
		
		[Embed(source='assets/fonts/SourceSansPro-Regular.ttf', embedAsCFF='false',fontName='SourceSansProRegular')]		
		public static var FontSSPRegular:Class;
		
		[Embed(source='assets/fonts/SourceSansPro-Bold.ttf', embedAsCFF='false',fontName='SourceSansProBold')]		
		public static var FontSSPBold:Class;
		
		[Embed(source='assets/fonts/ErasITC-Bold.ttf', embedAsCFF='false',fontName='ErasITCBold')]		
		public static var FontErasITC:Class;
		
		[Embed(source='assets/fonts/CarterOne.ttf', embedAsCFF='false',fontName='CarterOne')]		
		public static var FontCarterOne:Class;
		
		
		// sound assets
		[Embed(source="assets/sounds/bgm/01-Title.mp3")]
		private static var bgmTitleSound:Class;
		//[Embed(source="assets/sounds/bgm/02-Spring.mp3")]
		//private static var bgmSpringSound:Class;
		//[Embed(source="assets/sounds/bgm/03-Summer.mp3")]
		//private static var bgmSummerSound:Class;
		//[Embed(source="assets/sounds/bgm/04-Fall.mp3")]
		//private static var bgmFallSound:Class;
		//[Embed(source="assets/sounds/bgm/05-Winter.mp3")]
		//private static var bgmWinterSound:Class;
		
		public static var bgm:Sound;
		
		[Embed(source="assets/sounds/sfx/click.mp3")]
		private static var sfxClickSound:Class;
		public static var sfxClick:Sound;
		
		[Embed(source="assets/sounds/sfx/push.mp3")]
		private static var sfxPushSound:Class;
		public static var sfxPush:Sound;
		
		public static var bgmTransform:SoundTransform = new SoundTransform();
		public static var sfxTransform:SoundTransform = new SoundTransform();
		
		public static var bgmChannel:SoundChannel = new SoundChannel();
		public static var sfxChannel:SoundChannel = new SoundChannel();
		
		// constant variable
		public static var TEXTURE_MENU:String = "AtlasTextureMenu";
		public static var TEXTURE_MENU_XML:String = "AtlasMenuXML";
		
		public static var TEXTURE_DIALOG:String = "AtlasTextureDialog";
		public static var TEXTURE_DIALOG_XML:String = "AtlasDialogXML";
		
		public static var TEXTURE_PARAMETER:String = "AtlasTextureParameter";
		public static var TEXTURE_PARAMETER_XML:String = "AtlasParameterXML";
		
		public static var TEXTURE_HUD:String = "AtlasHUD";
		public static var TEXTURE_HUD_XML:String = "AtlasHUDXML";
		
		public static var TEXTURE_ACHIEVEMENT:String = "AtlasAchievement";
		public static var TEXTURE_ACHIEVEMENT_XML:String = "AtlasAchievementXML";
		
		public static var TEXTURE_PANEL:String = "AtlasPanel";
		public static var TEXTURE_PANEL_XML:String = "AtlasPanelXML";
		
		public static var TEXTURE_CONTENT:String = "AtlasContent";
		public static var TEXTURE_CONTENT_XML:String = "AtlasContentXML";
		
		public static var TEXTURE_MAP:String = "AtlasMap";
		public static var TEXTURE_MAP_XML:String = "AtlasMapXML";
		
		public static var BGM_TITLE:String = "title";
		public static var BGM_SPRING:String = "spring";
		public static var BGM_SUMMER:String = "summer";
		public static var BGM_FALL:String = "fall";
		public static var BGM_WINTER:String = "winter";
		
		private static var gameTexture:Dictionary = new Dictionary();
		private static var gameTextureAtlas:Dictionary = new Dictionary();
		private static var gameVectorFont:Dictionary = new Dictionary();
		
		
		public static function getAtlas(name:String, map:String):TextureAtlas
		{
			if(gameTextureAtlas[name] == undefined)
			{
				var texture:Texture = getTexture(name);
				var xml:XML = new XML(new Assets[map]());
				gameTextureAtlas[name] = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas[name];
		}
				
		public static function getTexture(name:String):Texture
		{
			if(gameTexture[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTexture[name] = Texture.fromBitmap(bitmap);
			}
			return gameTexture[name];
		}
		
		public static function getFont(name:String):Font
		{
			if(gameVectorFont[name] == undefined)
			{
				var font:Font = new Assets[name]();
				gameVectorFont[name] = font;
			}
			return gameVectorFont[name];
		}
		
		
		public static function init():void
		{				
			bgm = new bgmTitleSound();
			
			sfxClick = new sfxClickSound();
			sfxPush = new sfxPushSound();
			
			Option.volumeBgm = Config.volbgm;
			Option.volumeSfx = Config.volsfx;
			
			TextField.registerBitmapFont(new BitmapFont(Texture.fromBitmap(new Carter()), XML(new CarterXML())));
			TextField.registerBitmapFont(new BitmapFont(Texture.fromBitmap(new Carterdark()), XML(new CarterdarkXML())));
			setup();
			
		}
		
		public static function setup():void
		{			
			bgmTransform.volume = Option.volumeBgm/10;
			sfxTransform.volume = Option.volumeSfx/10;
						
			bgmChannel.soundTransform = bgmTransform;
			sfxChannel.soundTransform = sfxTransform;
		}
		
		public static function playBgm(bgm:String):void
		{
			if(bgm == Assets.BGM_TITLE)
			{
				bgm = new bgmTitleSound();
			}
			if(bgm == Assets.BGM_SPRING)
			{
				//bgm = new bgmSpringSound();
			}
			if(bgm == Assets.BGM_SUMMER)
			{
				//bgm = new bgmSummerSound();
			}
			if(bgm == Assets.BGM_FALL)
			{
				//bgm = new bgmFallSound();
			}
			if(bgm == Assets.BGM_WINTER)
			{
				//bgm = new bgmWinterSound();
			}
			Assets.bgmChannel.stop();
			Assets.bgmChannel = Assets.bgm.play(0,int.MAX_VALUE, bgmTransform);
			Assets.setup();
		}
		
	}
}