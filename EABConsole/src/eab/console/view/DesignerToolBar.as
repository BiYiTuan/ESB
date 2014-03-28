package eab.console.view
{
	import flash.events.MouseEvent;
	
	import mx.containers.ControlBar;
	import mx.containers.HBox;
	import mx.controls.LinkButton;
	import mx.controls.VRule;
	
	import eab.console.model.*;
	import eab.console.other.Localizator;
	import eab.console.viewhelper.DesignerToolBarVH;
	/**
	 * Tool Bar for OrDesigner.
	 */
	public class DesignerToolBar extends ControlBar
	{
		[Bindable]
        [Embed(source="../assets/icon/toolbar/newproject.gif")]
        public var newfolder :Class;
	
		[Bindable]
        [Embed(source="../assets/icon/toolbar/newfile.gif")]
        public var newfile :Class;

        [Bindable]
        [Embed(source="../assets/icon/toolbar/save.gif")]
        public var saveLocal :Class;

        [Bindable]
        [Embed(source="../assets/icon/toolbar/saveall.gif")]
        public var saveDB :Class;
        
        [Bindable]
        [Embed(source="../assets/icon/toolbar/bpel.gif")]
        public var deploy :Class;      

        [Bindable]
        [Embed(source="../assets/icon/toolbar/zoomin.gif")]
        public var zoomin :Class;

        [Bindable]
        [Embed(source="../assets/icon/toolbar/zoomout.gif")]
        public var zoomout :Class;

        [Bindable]
        [Embed(source="../assets/icon/toolbar/cut.gif")]
        public var cut :Class;

        [Bindable]
        [Embed(source="../assets/icon/toolbar/copy.gif")]
        public var copy :Class;

        [Bindable]
        [Embed(source="../assets/icon/toolbar/paste.gif")]
        public var paste :Class;
		
		private var newServiceButton :LinkButton = new LinkButton();
		private var newFlowButton :LinkButton = new LinkButton();
		
		private var saveLocalButton :LinkButton = new LinkButton();
		private var saveDBButton :LinkButton = new LinkButton();
		private var deployButton:LinkButton = new LinkButton();
		
		private var cutButton :LinkButton = new LinkButton();
		private var copyButton :LinkButton = new LinkButton();
		private var pasteButton :LinkButton = new LinkButton();
		
		private var zoomInButton :LinkButton = new LinkButton();
		private var zoomOutButton :LinkButton = new LinkButton();
		
		private var designerToolBarVH:DesignerToolBarVH;
		private var localizator : Localizator;

		public function DesignerToolBar() {
			super();
			this.designerToolBarVH = new DesignerToolBarVH(this, "DesignerToolBarVH");
			this.localizator = Localizator.getInstance();
			this.percentHeight = 2;
			this.percentWidth = 100;
			
			newServiceButton.setStyle("icon",newfolder);
			newServiceButton.percentHeight = 100;
			newServiceButton.width = 20;
			newServiceButton.toolTip = localizator.getText('toolbar.newservice');
			
			newFlowButton.setStyle("icon",newfile);
			newFlowButton.percentHeight = 100;
			newFlowButton.width = 20;
			newFlowButton.toolTip = localizator.getText('toolbar.newflow');
			
			saveLocalButton.setStyle("icon",saveLocal);
			saveLocalButton.percentHeight = 100;
			saveLocalButton.width = 20;
			saveLocalButton.toolTip = localizator.getText('toolbar.savelocal');
			
			saveDBButton.setStyle("icon",saveDB);
			saveDBButton.percentHeight = 100;
			saveDBButton.width = 20;
			saveDBButton.toolTip = localizator.getText('toolbar.savedb');
			
			deployButton.setStyle("icon",deploy);
			deployButton.height = 20;
			deployButton.width = 20;
			deployButton.percentHeight = 100;
			deployButton.width = 20;
			deployButton.toolTip = localizator.getText('toolbar.deploy');
			
			zoomInButton.setStyle("icon",zoomin);
			zoomInButton.height = 20;
			zoomInButton.width = 20;
			zoomInButton.percentHeight = 100;
			zoomInButton.width = 20;
			zoomInButton.toolTip = localizator.getText('toolbar.zoomin');
			
			zoomOutButton.setStyle("icon",zoomout);
			zoomOutButton.height = 20;
			zoomOutButton.width = 20;
			zoomOutButton.percentHeight = 100;
			zoomOutButton.width = 20;
			zoomOutButton.toolTip = localizator.getText('toolbar.zoomout');
			
			cutButton.setStyle("icon",cut);
			cutButton.height = 20;
			cutButton.width = 20;
			cutButton.percentHeight = 100;
			cutButton.width = 20;
			cutButton.toolTip = localizator.getText('toolbar.cut');
			
			copyButton.setStyle("icon",copy);
			copyButton.height = 20;
			copyButton.width = 20;
			copyButton.percentHeight = 100;
			copyButton.width = 20;
			copyButton.toolTip = localizator.getText('toolbar.copy');
			
			pasteButton.setStyle("icon",paste);
			pasteButton.height = 20;
			pasteButton.width = 20;
			pasteButton.percentHeight = 100;
			pasteButton.width = 20;
			pasteButton.toolTip = localizator.getText('toolbar.paste');
			
			//layout
			var newBox :HBox = new HBox();
			newBox.percentHeight = 100;
			newBox.width = 50;
			newBox.addChild(newServiceButton);
			newBox.addChild(newFlowButton);
			
			var saveBox :HBox = new HBox();
			saveBox.percentHeight = 100;
			saveBox.width = 80;
			saveBox.addChild(saveLocalButton);
			saveBox.addChild(saveDBButton);
			saveBox.addChild(deployButton);
			
			var zoomBox :HBox = new HBox();
			zoomBox.percentHeight = 100;
			zoomBox.width = 50;
			zoomBox.addChild(zoomInButton);
			zoomBox.addChild(zoomOutButton);
			
			var editBox :HBox = new HBox();
			editBox.percentHeight = 100;
			editBox.width = 80;
			editBox.addChild(cutButton);
			editBox.addChild(copyButton);
			editBox.addChild(pasteButton);			
			
			var vrule1 :VRule = new VRule();
			vrule1.percentHeight = 100;
			
			var vrule2 :VRule = new VRule();
			vrule2.percentHeight = 100;
			
			var vrule3 :VRule = new VRule();
			vrule3.percentHeight = 100;
			
			var vrule4:VRule = new VRule();
			vrule4.percentHeight = 100;
			
			this.setStyle("borderStyle", "solid");
			
			this.addChild(newBox);
			this.addChild(vrule1);
			this.addChild(saveBox);
			this.addChild(vrule2);
			this.addChild(editBox);
			this.addChild(vrule3);
			this.addChild(zoomBox);
			this.addChild(vrule4);			
			
			this.initEventListener();
		}

		private function initEventListener():void{
			this.newServiceButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.newServiceHandler);
			this.newFlowButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.newFlowHandler);
			
			this.saveLocalButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.onSaveLocalHandler);
			this.saveDBButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.onSaveDBHandler);
			this.deployButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.onDeployHandler);
			
			this.copyButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.onCopyHandler);
			this.pasteButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.onPasteHandler);
			this.cutButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.onCutHandler);
			
			this.zoomInButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.onZoomInHandler);
			this.zoomOutButton.addEventListener(MouseEvent.CLICK, designerToolBarVH.onZoomOutHandler);			
		}
	}
}