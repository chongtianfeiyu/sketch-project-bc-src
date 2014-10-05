package sketchproject.utilities
{
	public class ValueFormat
	{
		
		public static function format(value:int):String
		{
			var result:String = value.toString();
			if(result.length > 6)
			{
				result = value/1000 + " K";
			}
			if(result.length > 8)
			{
				result = value/1000000 + " M";
			}
			return result;
		}
	}
}