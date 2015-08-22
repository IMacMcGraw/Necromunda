
part of view;

class Transform{

	num _baseScale = 1, _activeScale = 1;
	final num _minScale, _maxScale;
	Vector _offset = new Vector.zero();

	double get absoluteScale => _baseScale*_activeScale;

	num get _screenWidth => _context.canvas.width;
	num get _screenHeight => _context.canvas.height;

	final CanvasRenderingContext2D _context;


	Transform(this._context, this._minScale, this._maxScale){
		this._apply();
	}

	scale(num a){
		(this._activeScale *= a)..clamp(_minScale, _maxScale);
		this._apply();
	}

	translate(num x, num y){
		this._offset.x += x;
		this._offset.y += y;
		this._apply();
	}

	Rect get viewRect{
		var halfWidth = _screenWidth/(2*absoluteScale);
		var halfHeight = _screenHeight/(2*absoluteScale);
		return new Rect(_offset.x - halfWidth, _offset.y - halfHeight, _offset.x + halfWidth, _offset.y + halfHeight);
	}

	_apply(){
		// Reset the context transform:
		this._context.resetTransform();
		// Center the screen:
		this._context.translate(-_screenWidth/2, -_screenHeight/2);
		// Apply the base scale:
		this._context.scale(_baseScale, _baseScale);
		// Apply translation in world coordinates:
		this._context.translate(this._offset.x, this._offset.y);
		// Apply active scale:
		this._context.scale(_activeScale, _activeScale);
	}
}