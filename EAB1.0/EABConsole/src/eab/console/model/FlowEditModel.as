package eab.console.model{
	
	import eab.console.business.EABConsoleServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class FlowEditModel{
		
		[Bindable]
		public var serviceList : Array;
		
		[Bindable]
		public var currentPage : Number = 1;
		
		[Bindable]
		public var countPerPage : Number = 24;
		
		[Bindable]
		public var serviceCount : Number;
		
		[Bindable]
		public var flowData : XML;
		
		[Bindable]
		public var flowName : String;
		
		[Bindable]
		public static var  i : int = 1; //added by wangfan
		
		public function FlowEditModel(name : String, data : XML) : void{
			this.flowName = name;
			this.flowData = data;
		}
		
		public function refresh() : void{
			refreshServiceCount();
			refreshServiceData();
			refreshFlow();	
		}
		
		private function refreshServiceCount() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("services");
			ro.getServiceCount();
            ro.addEventListener(ResultEvent.RESULT, getServiceCountResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		public function refreshServiceData() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("services");
			ro.listService(currentPage, countPerPage);
            ro.addEventListener(ResultEvent.RESULT, getServiceDataResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function getServiceCountResult(event :ResultEvent):void{
			serviceCount = event.result.valueOf();
   		}
		
		private function getServiceDataResult(event :ResultEvent):void{
			serviceList = event.result.valueOf();
   		}
		
		public function refreshFlow() : void{
		}
   		
 		private function fault(event :FaultEvent):void{
			//edited by wangfan
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