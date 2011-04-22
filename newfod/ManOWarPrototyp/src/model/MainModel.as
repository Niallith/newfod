package model
{
	import View.BasicView;
	
	import com.smartfoxserver.v2.SmartFox;
	
	import event.StateUpdateEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class MainModel extends EventDispatcher
	{
		//Liste des events
		public static const EVENT_STAGE_UPDATE:String = "StageUpdate";
		
		//Liste des rooms static
		public static const ROOM_LOBBY:String = "The Lobby";
		
		//Liste des states
		public static const STATE_LOGIN:String = "Login";
		public static const STATE_LOBBY:String = "Lobby";
		
		//Model singleton
		private static var mainModel:MainModel;
		public static function getInstance():MainModel
		{
			if(mainModel == null)
				mainModel = new MainModel();
			
			return mainModel;
		}
		
		//Smartfox
		private static var sfs:SmartFox;
		public static function getSmartfoxInstance():SmartFox
		{
			if(sfs == null)
				sfs = new SmartFox(true)
					
			return sfs;
		}
		
		//Current State
		private var currentState:String;
		public function setCurrentState(currentState:String):void
		{
			this.currentState = currentState;
			var stateUpdateEvent:StateUpdateEvent = new StateUpdateEvent(StateUpdateEvent.EVENT_STATE_UPDATE, MainModel.STATE_LOGIN);
			dispatchEvent(stateUpdateEvent);
			trace("DISPATCH EVENT : STATE_UPDATE_EVENT");
		}
		public function getCurrentState():String
		{
			return this.currentState;
		}
		
		//Current view
		private var currentView:BasicView;
		public function setCurrentView(currentView:BasicView):void
		{
			this.currentView = currentView;
		}
		public function getCurrentView():BasicView
		{
			return currentView;
		}
		
		//Initialisation du stage
		private var stage:Stage;
		public function setStage(stage:Stage):void
		{
			this.stage = stage;	
			dispatchEvent(new Event(EVENT_STAGE_UPDATE));
		}
		public function getStage():Stage
		{
			return this.stage;
		}
	
		//Username
		private var username:String;
		public function setUsername(username:String):void
		{
			this.username = username;
		}
		public function getUsername():String
		{
			return this.username;
		}
	}

	

}