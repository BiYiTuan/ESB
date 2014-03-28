package eab.console.commands
{
	import mx.controls.Alert;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.BpelEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.BpelEditor;
	import eab.console.viewhelper.BpelEditorVH;
	import eab.console.viewhelper.EditorNavigatorVH;
	
	/**
	 * Close the BPELEditor page and then cancel it.
	 */ 
	public class CancleCloseBPELEditorCMD extends EABCommand
	{
		public function CancleCloseBPELEditorCMD(){
			super();
		}
		/**
		 * 
		 * @param event {closedBPELEditor}
		 * 
		 */
		 override public function execute(event :EABFrameworkEvent) :void{
//			var closedBPELEditor : BpelEditor = event.data.closedBPELEditor as BpelEditor;
//			
//			if(closedBPELEditor == null)
//				Alert.show("closedFigureEditor null in CancleCloseBPELEditorCMD");
//			else {
//				var closedBEModel :BpelEditorModel = closedBPELEditor.bpelEditorModel
//				
//				//readd cancled-closing figure editor
//				var viewLoc : ViewLocator =  ViewLocator.getInstance();
//				var feNavModel :EditorNavigatorModel = 
//					EABConsoleModelLocator.getInstance().getFigureEditorNavigatorModel();
//				var feNavVH : EditorNavigatorVH = 
//					ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
//				feNavVH.createNewBpelEditor(closedBEModel, closedBPELEditor.filePath, closedBPELEditor.label);
//				var beVH :BpelEditorVH = viewLoc.getViewHelper(BpelEditorVH.getViewHelperKey(closedBEModel.fileID)) as BpelEditorVH;
//				
//				//reset current state and active figure editor model
//				feNavModel.activeBpelEditorModel = closedBPELEditor.bpelEditorModel;
//				
//				feNavVH.SwithToGivenFileID(closedBEModel.fileID);
//				beVH.updateTextArea(closedBEModel.bpelText);
//			}
		}
	}
}