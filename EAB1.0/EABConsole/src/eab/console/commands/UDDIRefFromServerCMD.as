package eab.console.commands
{
	import mx.rpc.events.ResultEvent;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.events.UDDIRefViewAppEvent;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.UDDIReferenceModel;

	public class UDDIRefFromServerCMD extends EABCommand{
		
		//model
		private var orDesModelLoc : EABConsoleModelLocator = EABConsoleModelLocator.getInstance();
		
		public var model : UDDIReferenceModel = orDesModelLoc.getUDDIReferenceModel();
		
		public function UDDIRefFromServerCMD(){
			super();
		}
		
		/**
		 * @param event{}
		 */
		override public function execute(event : EABFrameworkEvent) :void{
			
			getRefFromServer();
		}
		
		private function getRefFromServer() :void{
			
			var i:int;
			var tempstr:String;
			test();
		}
		
		private function test() : void {
			
//			var xml : XML = 
//			<servicesRef>
//				<serviceRef>
//					<ServiceName>{"TestWS"}</ServiceName>
//					<ServiceLocation>{"http://localhost/TestWS"}</ServiceLocation>
//				</serviceRef>
//				<serviceRef>
//					<ServiceName>{"ResourceService"}</ServiceName>
//					<ServiceLocation>{"http://localhost/ResourceService"}</ServiceLocation>
//				</serviceRef>
//			</servicesRef>;
//			
//			model.setXMLContent(xml);
		}
		
		private function getRefFromServerResult(event : ResultEvent):void{
			
			var str:String=event.result.toString();
			var OpId:String=str.substring(0,str.indexOf('|'));
			str=str.substring(str.indexOf('|')+1,str.length);
			var SerName:String=str.substring(0,str.indexOf('|'));
			str=str.substring(str.indexOf('|')+1,str.length);
			var OpName:String=str.substring(0,str.indexOf('|'));
			str=str.substring(str.indexOf('|')+1,str.length);
			var OpRef:String=str.substring(0,str.indexOf('|'));
			
			var newnode :XML = new XML();
			
			newnode =
				<serviceRef>
					<OpId>{OpId}</OpId>
					<SerName>{SerName}</SerName>
					<OpName>{OpName}</OpName>
					<OpRef>{OpRef}</OpRef>
				</serviceRef>;
				
			model.appendXMLContent(newnode);
		}
		
	}
}