
part of visible;

class Line extends geo.Line implements Visible{

	final Surface surface;

	Colour _colour;
	Colour get colour => _colour;
	void set colour(value){
		_colour = value;
		modified();
	}

	html.Path2D _path = new html.Path2D();
	html.Path2D get path => _path;

	Line(this.surface, num x1, num y1, num x2, num y2, this._colour) :
		super(x1, y1, x2, y2){

		surface.onRender.addListener( ([Null e]){
			surface.trace(this);
		});
	}

	modified([Null e]){
		super.modified();
		_path = new html.Path2D();
		_path.moveTo(p1.x, p1.y);
		_path.lineTo(p2.x, p2.y);
		surface.requestRender();
	}
}