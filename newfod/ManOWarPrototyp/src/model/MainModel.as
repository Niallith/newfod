package model
{
	import Views.abstracts.BasicView;
	
	import event.StateUpdateEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import playerio.Client;
	import playerio.Connection;
	import playerio.PlayerIO;
	
	public class MainModel extends EventDispatcher
	{
		//Liste des events
		public static const EVENT_STAGE_UPDATE:String = "StageUpdate";
		public static const EVENT_CONNECTION_UPDATE:String = "ConnexionUpdate";
		//Liste des rooms static
		public static const ROOM_LOBBY:String = "Lobby";
		
		//Liste des states
		public static const STATE_LOGIN:String = "LoginView";
		public static const STATE_LOBBY:String = "LobbyView";
		public static const STATE_MAIN_GAME:String = "MainGameView";
		
		//Model singleton
		private static var mainModel:MainModel;
		public static function getInstance():MainModel
		{
			if(mainModel == null)
				mainModel = new MainModel();
			
			return mainModel;
		}
		
		//PlayerIO client
		private var client:Client;
		public function setClient(client:Client):void
		{
			this.client = client;
		}
		public function getClient():Client
		{
			return this.client;
		}
		
		//PlayerIO connection
		private var connection:Connection
		public function setConnection(connection:Connection):void
		{
			this.connection = connection;
			dispatchEvent(new Event(EVENT_CONNECTION_UPDATE));
		}
		public function getConnection():Connection
		{
			return this.connection;
		}
		
		//Current State
		private var currentState:String;
		public function setCurrentState(currentState:String):void
		{
			this.currentState = currentState;
			var stateUpdateEvent:StateUpdateEvent = new StateUpdateEvent(StateUpdateEvent.EVENT_STATE_UPDATE, currentState);
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