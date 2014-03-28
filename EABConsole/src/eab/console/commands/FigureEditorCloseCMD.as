package eab.console.commands
{
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.state.SelectionState;
	import eab.console.view.BpelEditor;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.view.SaveChangeWindow;
	import eab.console.viewhelper.EditorNavigatorVH;
	
	/**
	 * Close a figureEditor page.
	 */ 
	public class FigureEditorCloseCMD extends EABCommand{
		
//		private var closedFE : FigureEditor;
		private var filePath :String;
		public function FigureEditorCloseCMD(){
			super();
		}
		
		/**
		 * 
		 * @param event {closedFE}
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
//			closedFE = event.data.closedFE;
//			filePath = closedFE.filePath;
//			//parameter		
//			var orDesModelLoc :EABConsoleModelLocator = EABConsoleModelLocator.getInstance();
//		
//			var feNavModel :EditorNavigatorModel = orDesModelLoc.getFigureEditorNavigatorModel();
//			
//			var feNavVH :EditorNavigatorVH = 
//					ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
//			
//			var saveChangeWindow :SaveChangeWindow = SaveChangeWindow(
//					PopUpManager.createPopUp(EABConsoleModelLocator.getInstance().getEABConsole(), SaveChangeWindow, true));
//			//added by zjn 09.7.28
//			saveChangeWindow.setClosedFE(closedFE);
//			saveChangeWindow.setFileName(filePath.substring(filePath.lastIndexOf("\\",filePath.length) + 1,filePath.length));
//			saveChangeWindow.addEventListener(CloseEvent.CLOSE, updateCanvasXML);
//			PopUpManager.centerPopUp(saveChangeWindow);
//				
//			orDesModelLoc.getFigureCanvasStateDomain().setFCActiveState(new SelectionState());
//			
//			//as the last index figure editor page automatically become the active figure editor,
//			//set the last figure editor model to be the active figure editor model
//			var lastFeNavChild :EditorNavigatorChild = feNavVH.getSelectedChildOfNavigator();
//					
//			if(lastFeNavChild != null) {
//				if(lastFeNavChild.type == EditorNavigatorChild.FIGURE_EDITOR_TYPE){
//					feNavModel.activeFigureEditorModel = FigureEditor(lastFeNavChild).figureEditorModel;
//					
//				}else if( lastFeNavChild.type == EditorNavigatorChild.BPEL_EDITOR_TYPE){
//					feNavModel.activeBpelEditorModel = BpelEditor(lastFeNavChild).bpelEditorModel;
//					feNavModel.activeFigureEditorModel = null; 
//				}
//				
//			}else {
//				feNavModel.activeFigureEditorModel = null;
//				
//			}
//			//reset attribute view's showing figure
//			orDesModelLoc.getAttributeViewModel().editedFigure = null;
//			orDesModelLoc.getAttributeViewModel().updateAttribute();
		}
		
		private function updateCanvasXML(event :CloseEvent):void{
//			closedFE.figureEditorModel.updateCanvasXML();
//			closedFE.figureEditorModel.saveCanvasXML();
		}

	}
}