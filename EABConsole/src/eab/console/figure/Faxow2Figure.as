package eab.console.figure
{
	import eab.console.vo.FaxAttribute;
	
	public class Faxow2Figure extends BusinessFigure
	{
		public function Faxow2Figure()
		{
			super();
			
			//added by zjn
			this.attribute = new FaxAttribute;
			
			this.drawid=105;
			this.setpicture(FigureFactory.fax);
		}
		
	}
}