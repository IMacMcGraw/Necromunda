
part of events;

class GameEvents{

	/// This method dispatches this object's onRender event
	/// and can be overriden to include any additional operations
	/// that should be executed when this event occurs.
	/// Be sure to invoke the super method when overriding, or else
	/// the onRender event will not be dispatched.
	dynamic render([Null e]) => _render.dispatch(e);
	final Source<Null> _render = new Source<Null>();
	Stream<Null> get onRender => _render.stream;

	/// This method dispatches this object's onUpdate event
	/// and can be overriden to include any additional operations
	/// that should be executed when this event occurs.
	/// Be sure to invoke the super method when overriding, or else
	/// the onUpdate event will not be dispatched.
	dynamic update(DeltaT e) => _update.dispatch(e);
	final Source<DeltaT> _update = new Source<DeltaT>();
	Stream<DeltaT> get onUpdate => _update.stream;
}

abstract class MouseEvents{

	/// This method dispatches this object's onMouseMove event
	/// and can be overriden to include any additional operations
	/// that should be executed when this event occurs.
	/// Be sure to invoke the super method when overriding, or else
	/// the onMouseMove event will not be dispatched.
	bool mouseMove(MouseData e) => _mouseMove.dispatch(e);

	final Source<MouseData> _mouseMove = new Source<MouseData>(interceptable: true);
	Stream<MouseData> get onMouseMove => _mouseMove.stream;

	/// This method dispatches this object's onMouseDown event
	/// and can be overriden to include any additional operations
	/// that should be executed when this event occurs.
	/// Be sure to invoke the super method when overriding, or else
	/// the onMouseDown event will not be dispatched.
	bool mouseDown(MouseData e) => _mouseDown.dispatch(e);

	final Source<MouseData> _mouseDown = new Source<MouseData>(interceptable: true);
	Stream<MouseData> get onMouseDown => _mouseDown.stream;

	/// This method dispatches this object's onMouseUp event
	/// and can be overriden to include any additional operations
	/// that should be executed when this event occurs.
	/// Be sure to invoke the super method when overriding, or else
	/// the onMouseUp event will not be dispatched.
	bool mouseUp(MouseData e) => _mouseUp.dispatch(e);

	final Source<MouseData> _mouseUp = new Source<MouseData>(interceptable: true);
	Stream<MouseData> get onMouseUp => _mouseUp.stream;
}

abstract class ViewEvents{

	/// This method dispatches this object's viewChanged event
	/// and can be overriden to include any additional operations
	/// that should be executed when this event occurs.
	/// Be sure to invoke the super method when overriding, or else
	/// the onViewChanged event will not be dispatched.
	dynamic viewChanged(Rect e) => _viewChanged.dispatch(e);

	final Source<Rect> _viewChanged = new Source<Rect>();
	Stream<Rect> get onViewChanged => _viewChanged.stream;
}