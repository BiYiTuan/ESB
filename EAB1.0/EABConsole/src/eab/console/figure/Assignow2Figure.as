package eab.console.figure
{
	import eab.console.vo.AssignAttribute;
	
	public class Assignow2Figure extends BPELFigure
	{
		public function Assignow2Figure()
		{
			super();
			
			this.attribute = new AssignAttribute;
			
			this.drawid=112;
			this.setpicture(FigureFactory.assign);
		}
		
	}
}