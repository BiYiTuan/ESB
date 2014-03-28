package eab.console.view
{
	import mx.controls.LinkButton;
	import mx.controls.TileList;
	import mx.core.ClassFactory;

	public class ToolTile extends TileList
	{
		
		private var content :Array = new Array();
		
		private var toolData :Array = new Array();
			
		public function setToolData(data:Array):void{
			this.toolData = data;			
		}	
		
		public function ToolTile()
		{
			super();
			
			this.percentHeight = 100;
			this.percentWidth = 100;
			
			this.itemRenderer = new ClassFactory(ToolRenderer);
			this.direction = "vertical";
			this.explicitRowCount = 5;
			this.explicitColumnCount = 1;
			this.rowHeight = 25;
			this.dataProvider = content;			
			this.dragEnabled = true;
			this.dragMoveEnabled = false;
		}

		public function initArray() :void{			
			for each(var item:Object in toolData) {
				var button :LinkButton = new LinkButton();
				button.label = item.name;
				button.data = item;
				button.buttonMode = false;
				button.percentWidth = 100;
				button.height = 16;
				content.push(button);
			}
		}		
	}
}