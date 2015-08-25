
part of view;


/// A drawing surface.
class Surface extends Object with GameEvents, MouseEvents, ViewEvents{
	final int zIndex;
	final Viewport _view = new Viewport();
	final html.CanvasElement _canvas = new html.CanvasElement();
	html.CanvasRenderingContext2D get _context => _canvas.context2D;


	final Source<geo.Rect> _viewChanged
		= new Source<geo.Rect>();

	Stream<geo.Rect> get onViewChanged => _viewChanged.stream;


	Surface([this.zIndex = 0])
	{
		_canvas.style.zIndex = zIndex.toString();
		_stretchToFillScreen();

		_view.onRender.addBranch(_render);
		_view.onUpdate.addBranch(_update);

		_view.onViewChanged.addListener( (e){
			_stretchToFillScreen();
			_viewChanged.dispatch(e);
		});

		_view.onMouseMove.addBranch(_mouseMove);
		_view.onMouseDown.addBranch(_mouseDown);
		_view.onMouseDown.addBranch(_mouseUp);
	}

	_stretchToFillScreen(){
		this._canvas.width = html.window.innerWidth;
		this._canvas.height = html.window.innerHeight;
	}

	geo.Rect get _viewRect => new geo.Rect(0, 0, this._canvas.width, this._canvas.height);


	void Trace(Visible shape){
		var clr = shape.colour;
		this._context.setStrokeColorHsl(clr.degreesH, clr.percentS, clr.percentL, clr.a);
		this._context.stroke(shape.path);
	}

	void Fill(Visible shape){
		var clr = shape.colour;
		this._context.setFillColorHsl(clr.degreesH, clr.percentS, clr.percentL, clr.a);
		this._context.fill(shape.path);
	}
}