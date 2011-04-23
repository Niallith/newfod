package Views.abstracts
{

	import control.Controller;
	
	import flash.display.MovieClip;
	
	import model.MainModel;
	
	import playerio.Client;
	import playerio.Connection;
	import playerio.Multiplayer;
	import playerio.PlayerIO;
	import playerio.PlayerIOError;
	
	public class BasicView extends MovieClip
	{
		protected var controller:Controller = Controller.getInstance();
		protected var mainModel:MainModel = MainModel.getInstance();
		protected var client:Client = mainModel.getClient();

		//private var 
		public function BasicView()
		{
			
		}
		protected function handleError(error:PlayerIOError):void{
			trace("got",error);
		}
		protected function handleConnect(client:Client):void{
			trace("Sucessfully connected to player.io");
		}
		protected function handleJoin(connection:Connection):void
		{
			controller.setConnection(connection);
			trace("Sucessfully connected to the multiplayer server");
		}
			trace("Joined Room");
	}
}