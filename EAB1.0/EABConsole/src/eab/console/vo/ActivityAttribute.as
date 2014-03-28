package eab.console.vo
{
	import mx.collections.ArrayCollection;
	
	public class ActivityAttribute extends BasicAttribute
	{
		[Bindable]
		public var serviceName:String;
		
		public function ActivityAttribute()
		{
			super();
		}
		
		override public function getAttributeArray():ArrayCollection {
			var atts:ArrayCollection = super.getAttributeArray();
			atts.addItem({name: "Service: ", value: serviceName, flag: "true"});
			return atts;
		}

		override public function update(atts:ArrayCollection):void {
			super.update(atts);
			
			for each(var att:Object in atts) {
				if(att.name == "Service: ") {
					this.serviceName = att.value;
				}
			}
		}
		
		override public function getAttributeXML():Array {
			var xmlArray:Array = super.getAttributeXML();
			
			var snNode:XML = new XML("<Attribute></Attribute>");
			snNode.@name = "service";
			snNode.appendChild(this.serviceName);			
			
			xmlArray.push(snNode);
			return xmlArray;
		}
		
		override public function setAttribute(atts:XMLList):void {
			super.setAttribute(atts);

			var snNode:XMLList = atts.Attribute.(@name == "service");
	
			this.serviceName = (snNode.children()!=null)?snNode.children().toString():"";
		}
	}
}