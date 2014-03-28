package eab.console.figure
{
	public class Receiveow2Figure extends BPELFigure
	{
		import eab.console.vo.*;
		
		public function Receiveow2Figure()
		{
			super();
			
			this.attribute = new ReceiveAttribute();
			
			this.drawid=113;
			this.setpicture(FigureFactory.receive);
		}
		
	}
}