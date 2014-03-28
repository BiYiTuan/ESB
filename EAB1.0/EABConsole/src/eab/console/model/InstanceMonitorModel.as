package eab.console.model{
	
	import eab.console.business.EABConsoleServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class InstanceMonitorModel{
		
		[Bindable]
		public var instanceData : Object;
		
		[Bindable]
		public var flowData : Object;
		
		public function InstanceMonitorModel(data : Object) : void{
			this.instanceData = data;
		}
		
		public function refresh() : void{
			refreshInstance();		
			refreshFlow();	
		}
		
		public function refreshInstance() : void{
			if(instanceData == null)
				return;
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("instances");
			ro.loadInstance(instanceData.id);
            ro.addEventListener(ResultEvent.RESULT, refreshInstanceResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		public function refreshFlow() : void{
			if(instanceData == null)
				return;
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("processes");
			ro.getEABFlowFromODEProcess(instanceData.process.processType);
            ro.addEventListener(ResultEvent.RESULT, refreshFlowResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}

		private function refreshInstanceResult(event :ResultEvent):void{
			instanceData = event.result.valueOf();
   		}
   		
   		private function refreshFlowResult(event :ResultEvent):void{
			flowData = event.result.valueOf();
   		}
   		
 		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }  
	}
}