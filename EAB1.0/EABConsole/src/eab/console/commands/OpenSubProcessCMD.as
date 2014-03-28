package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.events.FigureCanvasAppEvent;
	import eab.console.events.FunctionNavigatorViewAppEvent;
	import eab.console.figure.SubProcessow2Figure;
	/**
	 * Create a new subProcess file in fileNavigator and a subProcess figure.
	 */ 
	public class OpenSubProcessCMD extends EABCommand
	{
		public function OpenSubProcessCMD(){
			super();
		}
		/**
		 * @param event {subProcessFigure}
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
			var subProcessFigure : SubProcessow2Figure = event.data.subProcessFigure as SubProcessow2Figure;
			var spFileName : String = subProcessFigure.getSubProcessFileName();
			var tempSpFileName : String = spFileName;
			var spFileID : String = subProcessFigure.getSubProcessFileID();
			var spFilePath : String = subProcessFigure.getSubProcessFilePath();
//			if(spFileID != null && spFileName != null) {
//				new FunctionNavigatorViewAppEvent(FunctionNavigatorViewAppEvent.FIGUREFILE_OPEN,
//				{fileID:spFileID,filePath:spFilePath,fileName:tempSpFileName}).dispatch();
//			}
//			else {
//				new FigureCanvasAppEvent(FigureCanvasAppEvent.CREATE_NEW_SUBPROCESS,
//				{subProcessFigure:subProcessFigure}).dispatch();
//			}
		}
		
	}
}