package eab.console.state
{
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.FigureCanvasStateDomain;
	import eab.console.model.FigureEditorModel;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.view.FlowEditView;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.FlowEditViewVH;
	import eab.framework.view.ViewLocator;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class AbstractState implements IState{
		
		protected var fcStateDomain:FigureCanvasStateDomain;
		
		public function AbstractState(){
			this.fcStateDomain = EABConsoleModelLocator.getInstance().getFigureCanvasStateDomain();
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
		
		public function mouseDoubleClick(point:Point,event:MouseEvent):void{
		}
		
		public function mouseClick(point:Point,event:MouseEvent):void{
		}
		
		public function mouseDown(point:Point,event:MouseEvent):void{
		}
		
		public function mouseUp(point:Point,event:MouseEvent):void{
		}
		
		public function mouseMove(point:Point,event:MouseEvent):void{
		}
		
		public function keyDown(event:KeyboardEvent):void{
		}
		
		public function keyUp(event:KeyboardEvent):void{
		}
		
		public function RollOut(event:MouseEvent):void{
		}
		
		public function RollOver(event:MouseEvent):void{
		}
		
	}
}