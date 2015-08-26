
part of geo;

class Circle extends DependentMutable implements Geo{

	num _radius;
	num get radius => _radius;
	void set radius(num value){
		_radius = value;
		modified();
	}

	Vector _origin;
	Vector get origin => _origin;
	void set origin(Vector value){
		_origin = value;
	}

	Circle.fromVector(this._origin, this._radius) : super();

	Circle(num x, num y, num radius) :
		this.fromVector(new Vector(x, y), radius);


	Rect get boundingBox => new Rect(origin.x - radius, origin.y - radius,
									 origin.x + radius, origin.y + radius);

	bool contains(Vector point) => point.distanceTo(origin) <= radius;

}