package eab.console.commands
{	
	import eab.console.model.FigureEditorModel;
	import eab.console.view.FlowEditView;
	import eab.framework.control.EABFrameworkEvent;
	
	import flash.events.Event;
	import flash.net.FileFilter;
	import flash.net.FileReference;

	public class FlowSaveLocalCMD extends EABEditorCommand
	{
		public function FlowSaveLocalCMD(){
		}

		override public function execute(event :EABFrameworkEvent) :void{
			var figureEditorModel : FigureEditorModel = this.getActiveEditorModel();
			var flowEditView : FlowEditView = this.getActiveEditorView();
			
			if(figureEditorModel == null || flowEditView == null)
				return;
				
			figureEditorModel.saveCanvasXML();
			
			var flowDesc : String = figureEditorModel.canvasXML;			
			
			var file:FileReference = new FileReference();
			file.save(flowDesc, flowEditView.flowEditModel.flowName + ".xml");
		}
	}
}