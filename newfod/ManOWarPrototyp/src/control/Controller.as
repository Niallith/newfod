package control
{
	import Views.LobbyView;
	import Views.LoginView;
	import Views.abstracts.BasicView;
	import Views.abstracts.MainGameView;
	import Views.abstracts.MainView;
	
	import flash.display.MovieClip;
	
	import model.MainModel;
	
	import playerio.Connection;

	public class Controller
	{
		private var mainModel:MainModel = MainModel.getInstance();

		private static var controller:Controller;
		
		//SINGLETON
		public static function getInstance():Controller
		{
			if(controller == null)
				controller = new  Controller();
			
			return controller;
		}
		
		
		//VIEWS
		//Remove current view
		public function removeCurrentView():void
		{
			if(mainModel.getCurrentView() != null)
				mainModel.getStage().removeChild(mainModel.getCurrentView());
		}
		//Main view
		public function addMainView():void
		{
			trace("addMainView()");
			var mainView:MainView = new MainView();
			mainModel.getStage().addChild(mainView);
			
			//Set default first screen (login)
			mainModel.setCurrentState(MainModel.STATE_LOGIN);
		}
	
		//Login view
		public function addLoginView():void
		{
			removeCurrentView();
			
			var loginView:BasicView = new LoginView();
			mainModel.getStage().addChild(loginView);
			mainModel.setCurrentView(loginView);
		}
		
		//Lobby view
		public function addLobbyView():void
		{
			removeCurrentView();
		
			var lobbyView:BasicView = new LobbyView();
			mainModel.getStage().addChild(lobbyView);
			mainModel.setCurrentView(lobbyView);
		}
		
		//Main game view
		public function addMainGameView():void
		{
			removeCurrentView();
			
			var mainGameView:BasicView = new MainGameView();
			mainModel.getStage().addChild(mainGameView);
			mainModel.setCurrentView(mainGameView);
		}

		//New state
		public function setNewState(state:String):void
		{
			mainModel.setCurrentState(state);
		}
		//PlayerIO Action
		public function setConnection(connection:Connection):void
		{
			mainModel.setConnection(connection);
		}
		
	}
}