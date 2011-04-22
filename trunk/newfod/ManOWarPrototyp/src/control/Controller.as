package control
{
	import View.BasicView;
	import View.LobbyView;
	import View.LoginView;
	import View.MainView;
	
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.requests.JoinRoomRequest;
	import com.smartfoxserver.v2.requests.LoginRequest;
	
	import flash.display.MovieClip;
	
	import model.MainModel;

	public class Controller
	{
		private var mainModel:MainModel = MainModel.getInstance();
		private var sfs:SmartFox = MainModel.getSmartfoxInstance();
		
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
		}
		
		//Lobby view
		public function addLobbyView():void
		{
			removeCurrentView();
		
			var lobbyView:BasicView = new LobbyView();
			mainModel.getStage().addChild(lobbyView);
		}
			
		//SmartfoxAction
		public function sfsLoadConfig():void
		{
			sfs.loadConfig();
		}
		public function sfsLogin(username:String, password:String = "", room:String = ""):void
		{
			mainModel.setUsername(username);
			sfs.send(new LoginRequest(username, password, room));
		}
		public function sfsJoinRoom(id:*, pass:String = null):void
		{
			sfs.send(new JoinRoomRequest(id,pass));
		}
	}
}