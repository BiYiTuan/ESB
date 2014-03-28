package eab.console.model{
	
	import eab.console.business.EABConsoleServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class LogListModel{
		
		[Bindable]
		public var logList : Array;
		
		[Bindable]
		public var currentPage : Number = 1;
		
		[Bindable]
		public var countPerPage : Number = 24;
		
		[Bindable]
		public var logCount : Number;
		
		[Bindable]
		public static var  i : int = 1; //added by wangfan
		
		public function LogListModel() : void{
		}
		
		public function refresh() : void{
			refreshCount();
			refreshData();
		}
		
		private function refreshCount() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("services");
			ro.getLogCount("", new Date(1900, 1), new Date(3000, 1));
            ro.addEventListener(ResultEvent.RESULT, getLogCountResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function refreshData() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("services");
			ro.listLogs(currentPage, countPerPage, "", new Date(1900, 1), new Date(3000, 1));
            ro.addEventListener(ResultEvent.RESULT, getLogListResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function getLogListResult(event :ResultEvent):void{
			try
			{
				logList = event.result.valueOf();   		
			}
			catch(error:Error)
			{				
			}
		}
		
		private function getLogCountResult(event :ResultEvent):void{
			logCount = event.result.valueOf();
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
        
        public function addService(obj : Object) : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("services");
			ro.deployService(obj.serviceName, obj.serviceURL, obj.serviceType);
            ro.addEventListener(ResultEvent.RESULT, addServiceResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
        }
        
        private function addServiceResult(event : ResultEvent):void{
        	if(!event.result.valueOf()){
        		Alert.show("注册服务失败!");
        	}else{
        		refresh();
        	}
        }
        
        public function deleteService(obj : Object) : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("services");
			ro.deleteService(obj.uniqueServiceName);
            ro.addEventListener(ResultEvent.RESULT, deleteServiceResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
        }
        
        private function deleteServiceResult(event : ResultEvent):void{
        	if(!event.result.valueOf()){
        		Alert.show("删除服务失败!");
        	}else{
        		refresh();
        	}
        }
	}
}