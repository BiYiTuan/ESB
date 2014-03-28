package eab.console.model
{
	
	import eab.console.events.UDDIRefViewAppEvent;
	/**
	 * Store message of UDDIRefView.
	 */
	public class UDDIReferenceModel
	{
		/**
		 * The xmlList for the dataprovider of UDDIRefView
		 */
		[Bindable]
		public var xmllist:XMLList = new XMLList();
		/**
		 * The xml for the dataprovider of UDDIRefView
		 */
		private var xml : XML = new XML();
		
		public function UDDIReferenceModel(){
			
		}
		
		public function setXMLContent(xml : XML) : void {
			this.xml = xml;
			this.xmllist = xml.elements();
		}
		
		public function appendXMLContent(xml : XML) : void {
			this.xml.appendChild(xml);
			this.xmllist = xml.elements();
		}
	}
}