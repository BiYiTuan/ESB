package eab.console.model{
	
	import eab.console.business.EABConsoleServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class InstanceListModel{
		
		[Bindable]
		public var instanceList : Array;
		
		[Bindable]
		public var currentPage : Number = 1;
		
		[Bindable]
		public var countPerPage : Number = 24;
		
		[Bindable]
		public var instanceCount : Number;
		
		[Bindable]
		public static var  i : int = 1; //added by wangfan
		
		public function InstanceListModel() : void{
		}
		
		public function refresh() : void{
			refreshCount();
			refreshData();
		}
		
		private function refreshCount() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("instances");
			ro.getInstanceCount("", -1, new Date(1900, 1), new Date(3000, 1), new Date(1900, 1), new Date(3000, 1));
            ro.addEventListener(ResultEvent.RESULT, getServiceCountResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function refreshData() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("instances");
			ro.getInstances(currentPage, countPerPage, "", -1, new Date(1900, 1), new Date(3000, 1), new Date(1900, 1), new Date(3000, 1));
            ro.addEventListener(ResultEvent.RESULT, getServiceListResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function getServiceListResult(event :ResultEvent):void{
			try
			{
				instanceList = event.result.valueOf();
			}
			catch(error:Error)
			{				
			}
   		}
		
		private function getServiceCountResult(event :ResultEvent):void{
			instanceCount = event.result.valueOf();
   		}
   		
		private function deleteInstanceResult(event :ResultEvent):void{
			refresh();
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
        
 		public function deleteInstance(obj : Object) : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("instances");
			ro.deleteInstance(obj.id);
            ro.addEventListener(ResultEvent.RESULT, deleteInstanceResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
        }
	}
}