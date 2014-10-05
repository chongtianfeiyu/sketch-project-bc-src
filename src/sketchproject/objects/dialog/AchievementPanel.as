package sketchproject.objects.dialog
{
	import sketchproject.core.Assets;
	import sketchproject.objects.Panel;
	import sketchproject.objects.list.AchievementAdapter;
	import sketchproject.utilities.Config;
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class AchievementPanel extends Panel
	{
		private var acheivementContainer:Sprite;
		private var dataAcheivement:Array;
		
		public function AchievementPanel()
		{
			super(
				Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("icon_star"),
				Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("title_achievement"),
				"Earn achievements by making good business and life decisions"
			);
			
			dataAcheivement = new Array();
			dataAcheivement[0] = ["achievement_sales", "Achieved sales revenue of IDR 500 K or more in a day", "icon_sales"];
			dataAcheivement[1] = ["achievement_location", "Sold product at every location, including agains a competitor", "icon_location"];
			dataAcheivement[2] = ["achievement_inventory", "Make perfect inventory number for 3 days in a row", "icon_inventory"];
			dataAcheivement[3] = ["achievement_customer", "Customer satisfaction at 90% or more for 7 days in a row", "icon_magnify"];
			dataAcheivement[4] = ["achievement_stress", "Keep stress level at 15% or less for 5 days in a row", "icon_clock"];
			dataAcheivement[5] = ["achievement_transaction", "Reach 50 transaction for 5 days in row", "icon_money"];
			dataAcheivement[6] = ["achievement_accounting", "Don't use hint feature in 7 days in row", "icon_list"];
			dataAcheivement[7] = ["achievement_booster", "Accomplish all booster feature in 5 level bar", "icon_chart"];
			dataAcheivement[8] = ["achievement_market", "Lead market share at 70% or more for 7 days in a row", "icon_shop"];
			dataAcheivement[9] = ["achievement_master", "Complete 20 question without fail in a row", "icon_book"];
			
			acheivementContainer = new Sprite();
			acheivementContainer.x = -380;
			acheivementContainer.y = -145;
			addChild(acheivementContainer);
			
			for(var i:uint = 0; i<dataAcheivement.length;i++){
				var acheivement:AchievementAdapter = new AchievementAdapter(
					Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture(dataAcheivement[i][2]),
					Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture(dataAcheivement[i][0]),
					dataAcheivement[i][1],
					5
				);
				acheivement.x = i * 185;
				acheivement.name = dataAcheivement[i][0].toString();
				acheivementContainer.addChild(acheivement);
				
				Config.achievement[dataAcheivement[i][0].toString()] = Math.random() * 10;
			}
			
			updateEarned();
		}
		
		public function checkSalesProgress():void
		{
			
		}
		
		public function updateEarned():void
		{
			for(var i:uint = 0; i<dataAcheivement.length;i++){
				AchievementAdapter(acheivementContainer.getChildByName(dataAcheivement[i][0])).earned(Config.achievement[dataAcheivement[i][0].toString()]);
			}			
		}
	}
}