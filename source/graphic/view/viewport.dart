
part of view;

class Viewport extends Object with GameEvents, MouseEvents, ViewEvents{

	static Viewport _instance;
	factory Viewport(){
		if(_instance == null) _instance = new Viewport._internal();
		return _instance;
	}
	Viewport._internal(){
		_RenderLoop();
		_UpdateLoop();

		html.window.onResize.listen( (e){
			var data = new geo.Rect(0, 0, html.window.innerWidth, html.window.innerHeight);
			viewChanged(data);
		} );

		html.window.onMouseMove.listen( (e){
			var data = new MouseData.fromMouseEvent(e);
			mouseMove(data);
		});
		html.window.onMouseDown.listen( (e){
			var data = new MouseData.fromMouseEvent(e);
			mouseDown(data);
		});
		html.window.onMouseUp.listen( (e){
			var data = new MouseData.fromMouseEvent(e);
			mouseUp(data);
		});
	}

	void _RenderLoop([num timeStamp]){
		render();
		html.window.requestAnimationFrame(_RenderLoop);
	}

	static const _updatePeriod = const Duration(milliseconds: 25);
	final Stopwatch _stopWatch = new Stopwatch()..start();
	void _UpdateLoop(){
		update(new DeltaT.micro(_stopWatch.elapsedMicroseconds));
		new async.Timer(_updatePeriod, _UpdateLoop);
		_stopWatch.reset();
	}

}