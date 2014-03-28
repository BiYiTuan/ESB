package eab.console.figure
{
	public class Invokeow2Figure extends BPELFigure
	{
		import eab.console.vo.*;
		
		public function Invokeow2Figure()
		{
			super();
			
			//added by zjn
			this.attribute = new InvokeAttribute();
			
			this.drawid=109;
			this.setpicture(FigureFactory.invoke);
		}
		
	}
}