package eab.console.figure
{
	public class Replyow2Figure extends BPELFigure
	{
		import eab.console.vo.*;
		
		public function Replyow2Figure()
		{
			super();
			
			this.attribute = new ReplyAttribute();
			
			this.drawid=110;
			this.setpicture(FigureFactory.reply);
		}
		
	}
}