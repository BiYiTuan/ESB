package eab.console.figure
{
	import eab.console.vo.PagerAttribute;
	
	public class Pagerow2Figure extends BusinessFigure
	{
		public function Pagerow2Figure()
		{
			super();
			
			this.attribute = new PagerAttribute;
			
			this.drawid=104;
			this.setpicture(FigureFactory.pager);
		}
		
	}
}