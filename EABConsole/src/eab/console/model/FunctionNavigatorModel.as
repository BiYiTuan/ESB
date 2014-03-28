package eab.console.model
{
	import mx.collections.XMLListCollection;

	public class FunctionNavigatorModel
	{
		[Bindable]
		public var xmlList:XMLList;
		
		[Bindable]
		public var xmlListCollection :XMLListCollection;
		
		public function FunctionNavigatorModel(){
			var xml:XML = new XML(
				<items>
					<group ID="esb" name="ESB" type="group">
						<folder ID="protocolManagement" name="协议管理" type="folder">
							<item ID="protocolFiles" name="协议文件管理" type="item"/>
							<item ID="protocolList" name="协议列表" type="item"/>
						</folder>
						<folder ID="serviceManagement" name="服务管理" type="folder">
							<item ID="serviceList" name="服务列表" type="item"/>
							<item ID="serviceLog" name="服务日志" type="item"/>
						</folder>
						<folder ID="flowManagement" name="流程管理" type="folder">
							<item ID="flowList" name="流程列表" type="item"/>
							<item ID="flowMonitor" name="流程监控" type="item"/>
						</folder>
					</group>
				</items>
			);
			
			this.xmlList = xml.elements("group");
			
			this.xmlListCollection = new XMLListCollection(this.xmlList);
		}
	}
}