package
{
	import flash.system.Security;

	public class Aain
	{
		public static var quizId:int = 1;
		public function Aain()
		{
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			var slide:SlideComponent = new SlideComponent();
			this["viewStack1"]
		}
	}
}