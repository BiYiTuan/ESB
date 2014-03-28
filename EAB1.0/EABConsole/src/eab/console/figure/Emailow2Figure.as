package eab.console.figure
{
	import eab.console.vo.EmailAttribute;
	
	public class Emailow2Figure extends BusinessFigure
	{
		public function Emailow2Figure()
		{
			super();
			
			//added by zjn
			this.attribute = new EmailAttribute();
			
			this.drawid=106;
			this.setpicture(FigureFactory.email);
		}
		
	}
}