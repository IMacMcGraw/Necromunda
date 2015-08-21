
part of geo;

/// A vector class that represents a point on a plane.
class Vector implements Shape2D{

	num x, y;

	Vector(this.x, this.y);
	Vector.zero() : this(0, 0);

	Vector operator +(Vector b) => new Vector(x + b.x, y + b.y);
	Vector operator -(Vector b) => new Vector(x - b.x, y - b.y);
	bool operator  ==(Vector b) => (x == b.x)&&(y == b.y);

	/// Scales this vector by a factor of 'a'.
	scale(num a){ x *= a; y *= a;  }

	/// Returns the length of this vector.
	num get length => sqrt(x*x + y*y);

	/// Returns a parallel vector of magnitude 1.
	Vector get unitVector => new Vector(x/length, y/length);

	/// Returns an orthogonal unit vector, facing left.
	Vector get orthogonal => new Vector(-y/length, x/length);

	/// Returns the inverse of this vector: a new vector with the values of x and y interchanged.
	Vector get _inverse => new Vector(y, x);

	/// Returns the bouding box of this vector.
	Rect get boundingBox => new Rect(x, y, 0, 0);

	/// Returns a string representation of this object.
	String toString() => 'Vector: ($x, $y)';

}