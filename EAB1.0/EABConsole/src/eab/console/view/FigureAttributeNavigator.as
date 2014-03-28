package eab.console.view
{
	import mx.containers.Box;
	import mx.containers.TabNavigator;
	import eab.console.other.Localizator;

	/**
	 * The view for figure's attribute.
	 */
	public class FigureAttributeNavigator extends TabNavigator
	{
		/**
		 * The source for "properties" image data binding.
		 */
		[Bindable]
        [Embed(source="../assets/icon/container/properties.gif")]
        public var properties :Class;
		
		private var figureAttributeView :AttributeView;
		
		/**
		 * Initialize figure's attribute view.
		 */
		public function FigureAttributeNavigator(){
			super();
			
			//modified by zjn
			figureAttributeView = new AttributeView();
			figureAttributeView.percentHeight = 80;
			figureAttributeView.percentWidth = 100;

			this.setStyle("borderStyle","solid");
			
			this.percentHeight=100;
			this.percentWidth=100;
			
			this.createNewFigureEditor(this);
		}
		
		private function createNewFigureEditor(tabNavigator :TabNavigator):void{
		
			var newBox :Box = new Box();
			newBox.addChild(figureAttributeView);
			newBox.percentHeight = 100;
			newBox.percentWidth = 100;
			newBox.label = Localizator.getInstance().getText("propertynavigator.property");
			newBox.icon = properties;
			tabNavigator.addChild(newBox);
		}
		
	}
}