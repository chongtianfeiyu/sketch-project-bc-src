package sketchproject.objects.list
{
	import sketchproject.core.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.VAlign;
	
	public class AchievementAdapter extends Sprite
	{
		private var baseList:Image;
		private var iconAchievement:Image;
		private var titleAcheivement:Image;
		private var descriptionAchievmeent:TextField;
		private var labelTotal:TextField;
		private var totalEarned:TextField;
		
		
		public function AchievementAdapter(textureIcon:Texture, textureTitle:Texture, description:String, total:int)
		{
			super();
			
			baseList = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("list_achievement"));
			baseList.pivotX = baseList.width * 0.5;;
			addChild(baseList);
			
			iconAchievement = new Image(textureIcon);
			iconAchievement.pivotX = iconAchievement.width * 0.5;
			iconAchievement.y = 185;
			addChild(iconAchievement);
			
			descriptionAchievmeent = new TextField(130, 100, description, Assets.getFont("FontErasITC").fontName, 12, 0xFFFFFF);
			descriptionAchievmeent.pivotX = descriptionAchievmeent.width * 0.5;
			descriptionAchievmeent.y = 28;
			descriptionAchievmeent.vAlign = VAlign.TOP;
			addChild(descriptionAchievmeent);
			
			labelTotal = new TextField(70, 60, "Total Earned", Assets.getFont("FontErasITC").fontName, 18, 0xFFFFFF);
			labelTotal.pivotX = labelTotal.width * 0.5;
			labelTotal.y = 90;
			labelTotal.vAlign = VAlign.TOP;
			addChild(labelTotal);
			
			totalEarned = new TextField(60, 40, total.toString(), Assets.getFont("FontCarterOne").fontName, 30, 0xFFFFFF);
			totalEarned.pivotX = totalEarned.width * 0.5;
			totalEarned.y = 130;
			totalEarned.vAlign = VAlign.TOP;
			addChild(totalEarned);
			
			titleAcheivement = new Image(textureTitle);
			titleAcheivement.pivotX = titleAcheivement.width * 0.5;
			titleAcheivement.pivotY = titleAcheivement.height * 0.5;
			titleAcheivement.y = 295;
			addChild(titleAcheivement);
		}
		
		public function earned(total:uint):void
		{
			totalEarned.text = total.toString();
		}
	}
}