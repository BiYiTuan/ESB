package eab.console.model{
	
	import eab.console.business.EABConsoleServiceLocator;
	
	import mx.collections.XMLListCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	public class ProtocolFilesModel{
		
		[Bindable]
		public var fileList : XML;
		
		[Bindable]
		public var curFilePath : String;
		
		[Bindable]
		public var curFile : XML;
		
		public function ProtocolFilesModel() : void{
		}
		
		public function refresh() : void{
			refreshFileList();
			refreshFile();
		}
		
		public function refreshFileList() : void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("protocols");
			ro.listAllFilesXml();
            ro.addEventListener(ResultEvent.RESULT, getFileListResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		public function refreshFile() : void{
			if(curFilePath == null || curFilePath.length == 0)
				return;
				
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("protocols");
			ro.readFile(curFilePath);
            ro.addEventListener(ResultEvent.RESULT, getFileResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		} 	
   		
   		private function getFileResult(event :ResultEvent):void{
			curFile = XML(event.result.valueOf());
   		}
   		
   		private function getFileListResult(event :ResultEvent):void{
			fileList = XML(event.result.valueOf());
   		}
   		
 		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }  
	}
}