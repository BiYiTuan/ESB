package eab.console.figure
{
	import eab.console.vo.VoiceAttribute;
	
	public class Voiceow2Figure extends BusinessFigure
	{
		public function Voiceow2Figure()
		{
			super();
			
			this.attribute = new VoiceAttribute;
			
			this.drawid=108;
			this.setpicture(FigureFactory.voice);
		}
		
	}
}