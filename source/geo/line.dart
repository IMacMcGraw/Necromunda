
part of geo;

class Line implements Shape2D{

	Vector p1, p2;

	Line(this.p1, this.p2);
	Line.byValue(num x1, num y1, num x2, num y2) : this(new Vector(x1, y1), new Vector(x2, y2));

	bool operator  ==(Line that) => (p1 == that.p1)&&(p2 == that.p2);

	/// Returns the vector from this line's origin to its endpoint.
	Vector get vector => p2 - p1;

	/// Returns the length of this line.
	num get length => vector.length;

	/// Returns the unit vector of this line.
	Vector get unitVector => vector.unitVector;

	/// Returns a rectangle with origin at a and opposing corner at b.
	Rect get boundingBox => new Rect.byCorners(p1, p2);

	/// Returns a string representation of this object.
	String toString() => 'Line: (${p1.x}, ${p1.y}) -> (${p2.x}, ${p2.y})';


	/// Is this line vertical?
	bool get _isVertical => p1.x == p2.x;

	/// Is this line horizontal?
	bool get _isHorizontal => p1.y == p2.y;

	/// Returns the inverse of this line, with x and y values interchanged.
	Line get _inverse => new Line.byValue(p1.y, p1.x, p2.y, p2.x);

	/// Returns the slope of this line, its rise over run.
	num get _m => (p2.y - p1.y)/(p2.x - p1.x);
	/// Returns the vertical displacement of this line from the origin.
	num get _b => (p1.y - _m*p1.x);
	/// Evaluates this line at x: y = m*x + b.
	num _evaluate(num x) => _m*x + _b;


	/// Returns the point of intersection nearest to the origin of this line if it exists, and null otherwise.
	Vector intersection(Line that){

		// We must know which line is the caller, so that if both lines are vertical
		// we can return the point of intersection nearest to the caller's origin.
		Vector intersectWithVertical({Line skew, Line vert, bool skewIsCaller}){

			Vector nearestAlongVertical(Vector origin, Vector a, Vector b){

				var distanceA = (a.y - origin.y).abs();
				var distanceB = (b.y - origin.y).abs();

				return (distanceA < distanceB)? a : b;
			}
			// If both are vertical and share the same bounding box, they must intersect.
			if(skew._isVertical){
				if(skewIsCaller) return nearestAlongVertical(skew.p1, vert.p1, vert.p2);
				else return nearestAlongVertical(vert.p1, skew.p1, skew.p2);
			}

			var y = this._evaluate(vert.p1.x);
			if( y < min(vert.p1.y, vert.p2.y) ) return null;
			if( y > max(vert.p1.y, vert.p2.y) ) return null;
			return new Vector(vert.p1.x, y);
		}

		// The intersection with horizontal case is solved using the intersection with vertical algorithm
		Vector intersectWithHorizontal({Line skew, Line hor, bool skewIsCaller}){
			// Transform the problem to the vertical case by inverting all parameters.
			var result = intersectWithVertical(skew:skew._inverse, vert:hor._inverse, skewIsCaller:skewIsCaller);
			// Undo the transform by inverting the result, and return the correct value.
			return (result == null)? null : result._inverse;
		}

		// This is the most general case: neither line is horizontal or vertical.
		Vector intersectWithSkew(Line P, Line Q){
			// This is the x-value of the apparent intersection.
			var x = (Q._b - P._b)/(P._m - Q._m);

			var apparentIntersect = new Vector(x, P._evaluate(x));

			if(!P.boundingBox.contains(apparentIntersect)) return null;
			if(!Q.boundingBox.contains(apparentIntersect)) return null;
			return apparentIntersect;
		}


		// If the lines' bounding boxes do not overlap, then they do not intersect and we can return null.
		if( !this.boundingBox.overlaps(that.boundingBox) ) return null;

		if( that._isVertical )  return intersectWithVertical(skew:this, vert:that, skewIsCaller:true);
		if( that._isHorizontal) return intersectWithHorizontal(skew:this, hor:that, skewIsCaller:true);
		if( this._isVertical )  return intersectWithVertical(skew:that, vert:this, skewIsCaller:false);
		if( this._isHorizontal) return intersectWithHorizontal(skew:that, hor:this, skewIsCaller:false);

		return intersectWithSkew(this, that);
	}

}