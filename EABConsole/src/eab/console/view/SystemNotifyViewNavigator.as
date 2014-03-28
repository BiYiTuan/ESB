package eab.console.view
{
	import eab.console.other.Localizator;
	
	import mx.containers.Box;
	import mx.containers.TabNavigator;

	public class SystemNotifyViewNavigator extends TabNavigator
	{
		[Bindable]
        [Embed(source="../assets/icon/container/uddi.gif")]
        public var uddi :Class;
        
        private var localizator :Localizator = Localizator.getInstance();

		public function SystemNotifyViewNavigator()
		{
			super();
			this.setStyle("borderStyle","solid");
			
			this.percentHeight=100;
			this.percentWidth=100;
			
			createSystemNofigyView(this);
		}
		
		private function createSystemNofigyView(tabNavigator :TabNavigator):void{			
			var newBox : Box = new Box();
			var systemNotifyView :SystemNotifyView = new SystemNotifyView();
			systemNotifyView.percentHeight = 100;
			systemNotifyView.percentWidth = 100;
			newBox.addChild(systemNotifyView);
			newBox.percentHeight = 100;
			newBox.percentWidth = 100;
			newBox.label = localizator.getText('notifynavigator.label');
			newBox.icon = uddi;
			tabNavigator.addChild(newBox);
		}
	}
}