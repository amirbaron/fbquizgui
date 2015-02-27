package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.collections.ArrayCollection;

	[Bindable] 
	public class Activity
	{
		public var currentSlide:int;
		
		[Bindable]
		public var slides:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public var name:String;
		
		[Bindable]
		public var type:String;
		
		[Bindable]
		public var title:String;
		
		[Bindable]
		public var logoImg:String;

		[Bindable]
		public var createdByImage:String;

		[Bindable]
		public var createdBy:String;

		[Bindable]
		public var ratingImage:String;
		
		
		[Bindable]
		public var entities:Object;
		
		[Bindable]
		public var selectedSlideIndex:int;
		
		public function Activity(jsonObject:Object)
		{
			currentSlide =0;
			name=jsonObject.name;
			type=jsonObject.type;
			title=jsonObject.title;
			logoImg=jsonObject.createdBy.logoImg;
			createdBy=jsonObject.createdBy.firstName;
			ratingImage=jsonObject.createdBy.ratingImg;
			
			for each(var jsonSlide:Object in jsonObject.slides) {
				var slide:Slide = new Slide(jsonSlide);
				slides.addItem(slide);
			}
			
		}
		
		
		
	}
}