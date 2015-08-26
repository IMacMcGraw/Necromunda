
part of view;


/// A drawing surface.
class Surface extends Object with GameEvents, MouseEvents, ViewEvents{
	final int zIndex;
	final Viewport view = new Viewport();
	final html.CanvasElement _canvas = new html.CanvasElement();
	html.CanvasRenderingContext2D get _context => _canvas.context2D;


	Surface([this.zIndex = 0])
	{
		html.document.body.append(_canvas);
		_canvas.style.zIndex = zIndex.toString();

		view.onRender.addListener(render);
		view.onUpdate.addListener(update);

		view.onViewChanged.addListener(viewChanged);

		view.onMouseMove.addListener(mouseMove);
		view.onMouseDown.addListener(mouseDown);
		view.onMouseDown.addListener(mouseUp);
	}

	@mustInvokeSuper
	viewChanged(Rect e){
		_canvas
			..width = e.width
			..height = e.height
			..style.position = 'absolute'
			..style.left = '0px'
			..style.top = '0px';
		super.viewChanged(e);
	}

	bool _renderRequest = false;
	void requestRender(){ _renderRequest = true; }



	void trace(Visible shape){
		var clr = shape.colour;
		this._context.setStrokeColorHsl(clr.degreesH, clr.percentS, clr.percentL, clr.a);
		this._context.lineWidth = 1;
		this._context.stroke(shape.path);
	}

	void Fill(Visible shape){
		var clr = shape.colour;
		this._context.setFillColorHsl(clr.degreesH, clr.percentS, clr.percentL, clr.a);
		this._context.fill(shape.path);
	}
}