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
		public var createdByFirstName:String;

		[Bindable]
		public var createdByLastName:String;

		[Bindable]
		public var ratingImage:String;
		
		[Bindable]
		public var imgSmall:String;
		
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
			logoImg=jsonObject.logoImg;
			createdByFirstName=jsonObject.createdBy.firstName;
			createdByLastName=jsonObject.createdBy.lastName;
			ratingImage=jsonObject.createdBy.ratingImg;
			imgSmall = jsonObject.createdBy.imgSmall;
			
			for each(var jsonSlide:Object in jsonObject.slides) {
				var slide:Slide = new Slide(jsonSlide);
				slides.addItem(slide);
			}
			
		}
		
		
		
	}
}