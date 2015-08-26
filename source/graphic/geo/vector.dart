
part of geo;

/// A vector class that represents a point on a plane.
class Vector extends Mutable implements Geo{

	num _x;
	num get x => _x;
	void set x(num value){
		_x = value;
		modified();
	}

	num _y;
	num get y => _y;
	void set y(num value){
		_x = value;
		modified();
	}

	/// Scales this vector by a factor of 'a'.
	scaleBy(num a){
		this._x *= a;
		this._y *= a;
		modified();
	}

	Vector(this._x, this._y);

	Vector.zero() : this(0, 0);

	Vector operator +(Vector b) => new Vector(x + b.x, y + b.y);
	Vector operator -(Vector b) => new Vector(x - b.x, y - b.y);
	bool operator  ==(Vector b) => (x == b.x)&&(y == b.y);
	Vector operator *(num a) => new Vector(a*x, a*y);


	/// Returns the length of this vector.
	num get length => sqrt(x*x + y*y);

	/// Returns a parallel vector of magnitude 1.
	Vector get unitVector => new Vector(x/length, y/length);

	/// Returns an orthogonal unit vector, facing left.
	Vector get orthogonal => new Vector(-y/length, x/length);

	/// Returns the inverse of this vector: a new vector with the values of x and y interchanged.
	Vector get inverse => new Vector(y, x);

	/// Returns the bouding box of this vector.
	Rect get boundingBox => new Rect(x, y, 0, 0);

	/// Returns a string representation of this object.
	String toString() => 'Vector: ($x, $y)';

	/// Returns the distance from this vector to vector b.
	num distanceTo(Vector b) => (this - b).length;

	/// Returns the nearest vector to this one from a list of vectors.
	Vector nearest(List<Vector> vectors)
		=> vectors.reduce( (a, b) => distanceTo(a) < distanceTo(b)? a : b );

}