package eab.console.model{
	
	import eab.console.business.EABConsoleServiceLocator;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class ProtocolListModel{
		
		[Bindable]
		public var protocolList : Array;
		
		[Bindable]
		public static var  i : int = 1; //added by wangfan
		
		public function ProtocolListModel() : void{
		}
		
		public function refresh() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("protocols");
			ro.listAllProtocols();
            ro.addEventListener(ResultEvent.RESULT, listProtocolsResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function listProtocolsResult(event :ResultEvent):void{
			try{
				protocolList = event.result.valueOf();
			}
			catch(error:Error)
			{				
			}
			
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