
part of view;

class GameEvents{

	final Source<Null> _render
		= new Source<Null>();
	final Source<DeltaT> _update
		= new Source<DeltaT>();

	Stream<Null> get onRender => _render.stream;
	Stream<DeltaT> get onUpdate => _update.stream;
}

abstract class MouseEvents{

	final Source<MouseData> _mouseMove
		= new Source<MouseData>(interceptable: true);
	final Source<MouseData> _mouseDown
		= new Source<MouseData>(interceptable: true);
	final Source<MouseData> _mouseUp
		= new Source<MouseData>(interceptable: true);

	Stream<MouseData> get onMouseMove => _mouseMove.stream;
	Stream<MouseData> get onMouseDown => _mouseDown.stream;
	Stream<MouseData> get onMouseUp => _mouseUp.stream;
}

abstract class ViewEvents{

	final Source<Rect> _viewChanged
		= new Source<Rect>();

	Stream<Rect> get onViewChanged => _viewChanged.stream;
}