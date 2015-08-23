
part of view;

class Signal{
	const Signal();
}

class DeltaT extends Signal{
	final double ms;
	const DeltaT(double milliseconds) : ms = milliseconds;
	const DeltaT.micro(int microseconds) : ms = microseconds/1000;
}


class Viewport{

	final List<Surface> _layers = new List<Surface>();

	final StreamController<Signal> _onRender = new StreamController<Signal>.broadcast();
	final StreamController<DeltaT> _onUpdate = new StreamController<DeltaT>.broadcast();


	// TODO: Remove 'name', is for testing the render callback.
	String name;
	Viewport(this.name){
		_RenderLoop();
		_UpdateLoop();

		var twentyFiveUpdates = onUpdate.take(25);
		twentyFiveUpdates.listen( (deltaT) => print(deltaT.ms) );
	}

	void _RenderLoop([num timeStamp]){
		_onRender.add(null);
		window.requestAnimationFrame(_RenderLoop);
	}

	static const _updatePeriod = const Duration(milliseconds: 50);
	final Stopwatch _stopWatch = new Stopwatch()..start();
	void _UpdateLoop(){
		_onUpdate.add(new DeltaT.micro(_stopWatch.elapsedMicroseconds));
		new Timer(_updatePeriod, _UpdateLoop);
		_stopWatch.reset();
	}



	Stream<Signal> get onRender => _onRender.stream;
	Stream<DeltaT> get onUpdate => _onUpdate.stream;
	Stream<Signal> get onResize => window.onResize.map((Event) => new Signal());
	Stream<MouseEvent> get onMouseMove => window.onMouseMove;


	UnmodifiableListView<Surface> get layers => new UnmodifiableListView(this._layers);
	addLayer(Surface surface){
		_layers.add(surface);
		_sortLayersByZIndex();
	}
	removeLayer(Surface surface){
		_layers.remove(surface);
	}
	_sortLayersByZIndex(){
		this._layers.sort( (A, B) {
			if(A.zIndex == B.zIndex) return 0;
			return (A.zIndex > B.zIndex)? 1 : -1;
		});
	}


}