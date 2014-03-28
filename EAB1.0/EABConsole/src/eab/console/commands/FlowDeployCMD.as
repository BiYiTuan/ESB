package eab.console.commands
{
	import eab.console.model.FigureEditorModel;
	import eab.console.view.FlowEditView;
	import eab.console.model.FlowListModel;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.business.EABConsoleServiceLocator;
	import eab.console.model.EABConsoleModelLocator;
	
	import mx.controls.Alert;	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class FlowDeployCMD extends EABEditorCommand
	{
		public function FlowDeployCMD(){
		}

		override public function execute(event :EABFrameworkEvent) :void{			
			var figureEditorModel : FigureEditorModel = this.getActiveEditorModel();
			var flowEditView : FlowEditView = this.getActiveEditorView();
			
			if(figureEditorModel == null || flowEditView == null)
				return;
			
			figureEditorModel.saveCanvasXML();
			
			var flowDesc : String = figureEditorModel.canvasXML;		
			
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("processes");
			ro.tinyDeploy(flowEditView.flowEditModel.flowName, flowDesc);
			ro.addEventListener(ResultEvent.RESULT, deployResult);
			ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function fault(event :FaultEvent):void{
			Alert.show("Remote invoke error: "+event.message);
		}  
		
		private function deployResult(event :ResultEvent):void{
			var flowListModel:FlowListModel = 
				EABConsoleModelLocator.getInstance().getFlowListModel();
			flowListModel.refresh();
		}
	}
}