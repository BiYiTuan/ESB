package eab.console.model{
	
	import eab.console.business.EABConsoleServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class ServiceListModel{
		
		[Bindable]
		public var serviceList : Array;
		
		[Bindable]
		public var currentPage : Number = 1;
		
		[Bindable]
		public var countPerPage : Number = 24;
		
		[Bindable]
		public var serviceCount : Number;
		
		[Bindable]
		public static var  i : int = 1; //added by wangfan
		
		
		public function ServiceListModel() : void{
		}
		
		public function refresh() : void{
			refreshCount();
			refreshData();
		}
		
		private function refreshCount() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("services");
			ro.getServiceCount();
            ro.addEventListener(ResultEvent.RESULT, getServiceCountResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function refreshData() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("services");
			ro.listService(currentPage, countPerPage);
            ro.addEventListener(ResultEvent.RESULT, getServiceListResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function getServiceListResult(event :ResultEvent):void{
			try
			{
				serviceList = event.result.valueOf();
			}
			catch(error :Error)
			{				
			}
   		}
		
		private function getServiceCountResult(event :ResultEvent):void{
			serviceCount = event.result.valueOf();
   		}
   		
 		private function fault(event :FaultEvent):void{
			//edited  by  wangfan
        	//Alert.show("Remote invoke error: "+event.message);
			//trace("Remote invoke error: "+event.message);
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