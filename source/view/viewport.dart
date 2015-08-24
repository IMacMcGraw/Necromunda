
part of view;

class Viewport{

	final List<Surface> _layers = new List<Surface>();


	final Dispatcher<Signal> _onRender
		= new Dispatcher<Signal>();

	final Dispatcher<DeltaT> _onUpdate
		= new Dispatcher<DeltaT>();

	final Dispatcher<Signal> _onResize
		= new Dispatcher<Signal>();

	final Dispatcher<MouseData> _onMouseMove
		= new Dispatcher<MouseData>(interceptable: true);

	final Dispatcher<MouseData> _onMouseDown
		= new Dispatcher<MouseData>(interceptable: true);

	final Dispatcher<MouseData> _onMouseUp
		= new Dispatcher<MouseData>(interceptable: true);




	static Viewport _instance;
	factory Viewport(){
		if(_instance == null) _instance = new Viewport._internal();
		return _instance;
	}
	Viewport._internal(){
		_RenderLoop();
		_UpdateLoop();

		window.onResize.listen( (e){
			_onResize.dispatch();
		});
		window.onMouseMove.listen( (e){
			var data = new MouseData.fromMouseEvent(e);
			_onMouseMove.dispatch(signal: data);
		});
		window.onMouseDown.listen( (e){
			var data = new MouseData.fromMouseEvent(e);
			_onMouseDown.dispatch(signal: data);
		});
		window.onMouseUp.listen( (e){
			var data = new MouseData.fromMouseEvent(e);
			_onMouseUp.dispatch(signal: data);
		});

	}

	void _RenderLoop([num timeStamp]){
		_onRender.dispatch();
		window.requestAnimationFrame(_RenderLoop);
	}

	static const _updatePeriod = const Duration(milliseconds: 25);
	final Stopwatch _stopWatch = new Stopwatch()..start();
	void _UpdateLoop(){
		_onUpdate.dispatch(signal: new DeltaT.micro(_stopWatch.elapsedMicroseconds));
		new Timer(_updatePeriod, _UpdateLoop);
		_stopWatch.reset();
	}

	Sequence<Signal> get onRender => _onRender.sequence;
	Sequence<Signal> get onUpdate => _onUpdate.sequence;
	Sequence<Signal> get onResize => _onResize.sequence;

	Sequence<MouseData> get onMouseMove => _onMouseMove.sequence;
	Sequence<MouseData> get onMouseDown => _onMouseDown.sequence;
	Sequence<MouseData> get onMouseUp => _onMouseUp.sequence;
}