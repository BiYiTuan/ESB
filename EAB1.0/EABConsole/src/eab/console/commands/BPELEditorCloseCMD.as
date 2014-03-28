package eab.console.commands
{
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.BpelEditor;
	import eab.console.view.SaveChangeWindow;
	
	/**
	 * Close the selected BPELEditor page
	 */ 
	public class BPELEditorCloseCMD extends EABCommand{
		
		private var closedBE :BpelEditor;
		private var filePath :String;
		public function BPELEditorCloseCMD(){
			super();
		}
		
		/**
		 * 
		 * @param event {closedBE}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
			//parameter
//			closedBE = event.data.closedBE;
//			filePath = closedBE.filePath;
//			
//			var saveChangeWindow :SaveChangeWindow = SaveChangeWindow(PopUpManager.createPopUp(
//					EABConsoleModelLocator.getInstance().getEABConsole(), SaveChangeWindow, true));
//						
//			saveChangeWindow.setFileName(filePath.substring(filePath.lastIndexOf("\\",filePath.length), filePath.length));
//			saveChangeWindow.setClosedBE(closedBE);
//			saveChangeWindow.addEventListener(CloseEvent.CLOSE, updateBPEL);
//			PopUpManager.centerPopUp(saveChangeWindow);
		}
		private function updateBPEL(event :CloseEvent):void{
			closedBE.bpelEditorModel.updateBpelTextByBpelText(closedBE.getBPELString());
		}
	}
}