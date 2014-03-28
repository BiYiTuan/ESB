package eab.console.figure
{
	public class Waitow2Figure extends BPELFigure
	{
		import eab.console.vo.*;
		
		public function Waitow2Figure()
		{
			super();
			
			this.attribute = new WaitAttribute();
			
			this.drawid=111;
			this.setpicture(FigureFactory.wait);
		}
		
	}
}