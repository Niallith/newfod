package View
{
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	
	import control.Controller;
	
	import flash.display.MovieClip;
	
	import model.MainModel;
	
	public class BasicView extends MovieClip
	{
		protected var sfs:SmartFox = MainModel.getSmartfoxInstance();
		protected var controller:Controller = Controller.getInstance();
		protected var mainModel:MainModel = MainModel.getInstance();
		private static var isSfsInit:Boolean = false;
		//private var 
		public function BasicView()
		{
			if(!isSfsInit)
			{
				sfs.addEventListener(SFSEvent.LOGIN, onLogin);
				sfs.addEventListener(SFSEvent.CONFIG_LOAD_SUCCESS, onConfigLoadSuccess);
				sfs.addEventListener(SFSEvent.CONNECTION, onConnection);
				sfs.addEventListener(SFSEvent.ROOM_JOIN, onRoomJoined);
				sfs.addEventListener(SFSEvent.LOGIN_ERROR, onLoginError);
				
				isSfsInit = true;
			}
		}
		protected function onLoginError(evt:SFSEvent):void
		{
			trace("Login failed: " + evt.params.errorMessage);
		}
		protected function onRoomJoined(e:SFSEvent):void
		{
			trace("SFS EVENT : ONROOMJOINED");
			if(e.params.room.name == MainModel.ROOM_LOBBY)
			{
				controller.addLobbyView();
			}
		}
		protected function onConfigLoadSuccess(e:SFSEvent):void
		{
			trace("SFS EVENT : ONCONFIGLOADSUCCESS");
		}
		protected function onConnection(e:SFSEvent):void
		{
			trace("SFS EVENT : ONCONNECTION");
		}
		protected function onLogin(e:SFSEvent):void
		{
			trace("SFS EVENT : ONLOGIN");
		}
	}
}