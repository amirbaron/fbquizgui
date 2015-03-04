package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import flashx.textLayout.formats.Float;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Text;

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

		[Bindable]
		public var slidesAnswered:int;
		
		[Bindable]
		public var points:int;

		[Bindable]
		public var summingPrecantage:Number

		[Bindable]
		public var summingTextHigh:String;

		[Bindable]
		public var summingTextMedium:String;

		[Bindable]
		public var summingTextLow:String;
		
		[Bindable]
		public var summingText:String;

		[Bindable]
		public var summingImage:String;
		
		public function Activity(jsonObject:Object)
		{
			currentSlide =0;
			points=0;
			slidesAnswered=0;
			name=jsonObject.name;
			type=jsonObject.type;
			title=jsonObject.title;
			logoImg=jsonObject.logoImg;
			createdByFirstName=jsonObject.createdBy.firstName;
			createdByLastName=jsonObject.createdBy.lastName;
			ratingImage=jsonObject.createdBy.ratingImg;
			imgSmall = jsonObject.createdBy.imgSmall;
			summingTextHigh = jsonObject.summingTextHigh;
			summingTextMedium = jsonObject.summingTextMedium;
			summingTextLow = jsonObject.summingTextLow;
			summingImage = jsonObject.summingImage;
			
			for each(var jsonSlide:Object in jsonObject.slides) {
				var slide:Slide = new Slide(jsonSlide);
				slides.addItem(slide);
			}
			
		}
		
		
		
	}
}