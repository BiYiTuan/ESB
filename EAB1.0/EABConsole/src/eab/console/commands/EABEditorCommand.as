package eab.console.commands
{
	import eab.console.model.FigureEditorModel;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.view.FlowEditView;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.FlowEditViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.view.ViewLocator;

	public class EABEditorCommand extends EABCommand{
		public function EABEditorCommand(){
			super();
		}
		
		public function getActiveEditorView():FlowEditView{
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
				
			if(editorNavigatorVH.getCurrentChildType() != EditorNavigatorChild.FLOW_EDIT_VIEW)
				return null;
			
			return editorNavigatorVH.getSelectedChildOfNavigator() as FlowEditView;
		}
		
		public function getActiveEditorModel(): FigureEditorModel{
			var activeEditorView : FlowEditView = getActiveEditorView();
			if(activeEditorView == null)
				return null;
			
			return activeEditorView.figureCanvas.getFigureEditorModel();
		}
		
		public function getActiveEditorViewHelper() : FlowEditViewVH{
			var activeEditorView : FlowEditView = getActiveEditorView();
			if(activeEditorView == null)
				return null;
			
			return activeEditorView.flowEditViewVH;
		}
		
		public function getEditorViewByID(editorID:String) : FlowEditView{
			if(editorID == null)
				return null;
			
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
				
			return editorNavigatorVH.findChildren(EditorNavigatorChild.FLOW_EDIT_VIEW, editorID) as FlowEditView;
		}
	}
}