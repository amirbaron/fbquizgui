package
{
	[Bindable]
	public class Slide
	{
		[Bindable]
		public var entities:Array = [] ;
		
		[Bindable]
		public var text:String;
		
		[Bindable]
		public var imgSmall:String;
		
		[Bindable]
		public var points:int;
		
		[Bindable]
		public var chooserChromeColor:uint;
		
		public function Slide(jsonSlide:Object )
		{
			text = jsonSlide.text;
			imgSmall = jsonSlide.imgSmall;
			
			for each(var jsonEntity:Object in jsonSlide.entities) {
				var entity:Entity = new Entity(jsonEntity);
				entities.push(entity);
			}
			
			points = 0;
			chooserChromeColor = 13421772;
		}
		

		
	}
}