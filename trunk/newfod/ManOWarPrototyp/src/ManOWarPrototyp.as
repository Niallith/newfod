package
{
	import view.abstracts.MainView;
	
	import control.Controller;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import model.MainModel;
	
	[SWF(width="640", height="480", backgroundColor="#333333", frameRate="24")]
	
	public class ManOWarPrototyp extends Sprite
	{
		private var mainModel:MainModel;
		private var controller:Controller; 
		
		public function ManOWarPrototyp()
		{
			mainModel = MainModel.getInstance();
			controller = Controller.getInstance();
			init();
		}
		public function init():void
		{
			mainModel.addEventListener(MainModel.EVENT_STAGE_UPDATE, stageUpdate);
			mainModel.setStage(this.stage);
		}
		
		private function stageUpdate(event:Event):void
		{
			//Ajout de la main view
			trace("EVENT_STAGE_UPDATE");
			controller.addMainView();
			
		}
	}
}