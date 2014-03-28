package eab.console.model{
	
	import eab.console.business.EABConsoleServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class FlowListModel{
		
		[Bindable]
		public var flowList : Array;
		
		[Bindable]
		public var currentPage : Number = 1;
		
		[Bindable]
		public var countPerPage : Number = 24;
		
		[Bindable]
		public var flowCount : Number;
		
		[Bindable]
		public static var  i : int = 1; //added by wangfan
		
		public function FlowListModel() : void{
		}
		
		public function refresh() : void{
			refreshCount();
			refreshData();
		}
		
		private function refreshCount() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("processes");
			ro.getProcessCount();
            ro.addEventListener(ResultEvent.RESULT, getFlowCountResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function refreshData() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("processes");
			ro.listFlow(currentPage, countPerPage);
            ro.addEventListener(ResultEvent.RESULT, getFlowListResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function getFlowListResult(event :ResultEvent):void{
			try
			{
				flowList = event.result.valueOf();
			}
			catch(error:Error)
			{				
			}
   		}
		
		private function getFlowCountResult(event :ResultEvent):void{
			flowCount = event.result.valueOf();
   		}
   		
 		private function fault(event :FaultEvent):void{
			//Edited by wangfan
        	//Alert.show("Remote invoke error: "+event.message);
			if(i == 1)
			{
				Alert.show("Remote invoke error: "+event.message);
			}
			i++;
			trace("Remote invoke error: "+event.message);
			trace(i);
        }  
	}
}