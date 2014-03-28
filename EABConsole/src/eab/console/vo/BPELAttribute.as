package eab.console.vo
{
	import mx.collections.ArrayCollection;
	
	/**
	 * The attribute about BPEL figures.
	 */
	public class BPELAttribute extends BasicAttribute
	{
			
		public function BPELAttribute()
		{
			super();
		}

		override public function getAttributeArray():ArrayCollection {
			return super.getAttributeArray();
		}
		
		override public function update(atts:ArrayCollection):void {
			super.update(atts);
		}
		
		override public function getAttributeXML():Array {
			var xmlArray:Array = super.getAttributeXML();
			
			return xmlArray;
		}
		
	}
}