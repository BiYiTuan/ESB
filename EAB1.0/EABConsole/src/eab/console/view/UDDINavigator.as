package eab.console.view
{
	import mx.containers.Box;
	import mx.containers.TabNavigator;
	
	import eab.console.other.Localizator;

	/**
	 * UDDI panel.
	 */
	public class UDDINavigator extends TabNavigator
	{
		/**
		 * The source for "uddi" image data binding.
		 */
		[Bindable]
        [Embed(source="../assets/icon/container/uddi.gif")]
        public var uddi :Class;
        
        private var localizator :Localizator = Localizator.getInstance();
		
		/**
		 * Initialize the UDDINavigator.
		 */
		public function UDDINavigator()
		{
			super();
			this.setStyle("borderStyle","solid");
			
			this.percentHeight=100;
			this.percentWidth=100;
			
			createNewUDDIView(this);
		}
		
		private function createNewUDDIView(tabNavigator :TabNavigator):void{
			
			var newBox : Box = new Box();
			var uddiView :UDDIReferenceView = new UDDIReferenceView();
			uddiView.percentHeight = 100;
			uddiView.percentWidth = 100;
			newBox.addChild(uddiView);
			newBox.percentHeight = 100;
			newBox.percentWidth = 100;
			newBox.label = localizator.getText('uddinavigator.label');
			newBox.icon = uddi;
			tabNavigator.addChild(newBox);
		}
	}
}