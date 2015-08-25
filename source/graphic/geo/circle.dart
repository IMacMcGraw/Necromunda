
part of geo;

class Circle extends Geo{

	num _radius;
	num get radius => _radius;
	void set radius(num value){
		_radius = value;
		modified();
	}

	Vector _origin;
	Vector get origin => _origin;
	void set origin(Vector value){
		replace(prev: _origin, next: value);
	}


	Circle(num x, num y, this._radius){
		// NOTE: It is important that this be done using the setter
		// and not the backing field (event subscription).
		origin = new Vector(x, y);
	}



	Rect get boundingBox => new Rect(x - radius, y - radius, x + radius, y + radius);

	bool contains(Vector point) => point.distanceTo(origin) <= radius;

}