package sketchproject.objects.list
{
	import sketchproject.core.Assets;
	import sketchproject.utilities.ValueFormat;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class LeaderboardAdapter extends Sprite
	{
		private var baseList:Image;
		private var avatarBase:Image;
		private var orderBase:Image;
		private var textOrder:TextField;
		private var textName:TextField;
		private var textScore:TextField;
		
		private var player:String;
		private var star:uint;
		private var score:uint;
		private var avatar:String;		
		private var order:uint;
		
		public function LeaderboardAdapter()
		{
			super();
			
			baseList = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("list_leaderboard"));
			baseList.y = 10.45;
			addChild(baseList);
			
			avatarBase = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("avatar_wrapper"));
			avatarBase.x = 15.55;
			addChild(avatarBase);
			
			orderBase = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("order_base"));
			orderBase.x = 4.35;
			orderBase.y = 10;
			addChild(orderBase);
			
			textOrder = new TextField(350, 25, "0", Assets.getFont("FontSSPRegular").fontName, 18, 0xFFFFFF);
			textOrder.pivotX = textOrder.width * 0.5;
			textOrder.pivotY = textOrder.height * 0.5;
			textOrder.x = 14;
			textOrder.y = 20;
			addChild(textOrder);
			
			textName = new TextField(300, 35, "0", Assets.getFont("FontSSPRegular").fontName, 17, 0xBC8458);;
			textName.x = 72;
			textName.y = 10;
			textName.hAlign = HAlign.LEFT;
			textName.vAlign = VAlign.TOP;
			addChild(textName);
			
			textScore = new TextField(300, 35, "0", Assets.getFont("FontSSPBold").fontName, 20, 0xBC8458);
			textScore.pivotX = textScore.width * 0.5;
			textScore.pivotY = textScore.height * 0.5;
			textScore.x = 335;
			textScore.y = 35;
			addChild(textScore);
		}
		
		public function set leaderOrder(order:uint):void
		{
			this.order = order;
		}
		
		public function set leaderPlayer(player:String):void
		{
			this.player = player;
		}
		
		public function set leaderStar(star:uint):void
		{
			this.star = star;
		}
		
		public function set leaderScore(score:uint):void
		{
			this.score = score;
		}
		
		public function set leaderAvatar(avatar:String):void
		{
			this.avatar = avatar;
		}
		
		public function get leaderOrder():uint
		{
			return order;
		}
		
		public function get leaderPlayer():String
		{
			return player;
		}
		
		public function get leaderStar():uint
		{
			return star;
		}
		
		public function get leaderScore():uint			
		{
			return score;
		}
		
		public function get leaderAvatar():String			
		{
			return avatar;
		}
		
		public function setup():void
		{
			textOrder.text = leaderOrder.toString();
			textName.text = leaderPlayer;
			textScore.text = ValueFormat.format(leaderScore) + " PTS";
			
			var star:Image;
			for(var i:uint = 0 ;i<5; i++)
			{
				if(i<leaderStar)
				{
					star = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("star"));					
				}
				else
				{
					star = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("star_base"));
				}
				star.x = (i * (star.width + 5)) + 76.9;
				star.y = 36;
				addChild(star);				
			}
		}
		
	}
}