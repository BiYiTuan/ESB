package eab.console.other
{
	public class FigureColorManager
	{
		private static var COLOR_DEFAULT : uint = uint(Localizator.getInstance().getText("graphics.color.default"));
		private static var COLOR_RUNNING : uint = uint(Localizator.getInstance().getText("graphics.color.running"));
		private static var COLOR_ERROR : uint = uint(Localizator.getInstance().getText("graphics.color.error"));
		private static var COLOR_OK : uint = uint(Localizator.getInstance().getText("graphics.color.ok"));

		public static function getColor(state:int):uint{
			switch(state){
				case -1:	// running
					return COLOR_RUNNING;
				case 0:		// ok
					return COLOR_OK;
				case 1:
					return COLOR_ERROR;
				default:
					return COLOR_DEFAULT;
			}
		}
	}	
}