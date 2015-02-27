package
{
	[Bindable]
	public class Entity
	{
		public function Entity(jsonEntity:Object )
		{
			points = jsonEntity.points;
			imgSmall = jsonEntity.imgSmall
			title = jsonEntity.title;
			chromeColor = 16777215;
			enabled = true;
		}
		
		[Bindable]
		public var points:int ;
		
		[Bindable]
		public var imgSmall:String;
		
		[Bindable]
		public var title:String;
		
		[Bindable]
		public var chromeColor:uint;
		
		[Bindable]
		public var enabled:Boolean;
		
	}
}