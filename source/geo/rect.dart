
part of geo;

/// The methods of the Rect class, including equality between
/// Rects, depend only on the max and min x and y values of an
/// instance. For this reason, a Rect with negative dimensions
/// behaves equivalently to, and is equal to a Rect with positive
/// dimensions, if both occupy the same region in 2-dimensional space.
class Rect implements Shape2D{

	num _xMin, _yMin, _xMax, _yMax;

	/// Creates a Rect, bounded by two x and two y values.
	Rect(num x1, num y1, num x2, num y2){
		_xMin = min(x1, x2);
		_xMax = max(x1, x2);
		_yMin = min(y1, y2);
		_yMax = max(y1, y2);
	}

	/// Creates a rectangle between two opposing corners.
	Rect.byCorners(Vector a, Vector b) : this(a.x, a.y, b.x, b.y);

	/// Returns a rect with all zero components.
	Rect.zero() : this(0,0,0,0);


	/// Gets this Rect's xMin value.
	num get xMin    => _xMin;
	/// Gets this Rect's yMin value.
	num get yMin    => _yMin;
	/// Gets this Rect's xMax value.
	num get xMax    => _xMax;
	/// Gets this Rect's yMax value.
	num get yMax    => _yMax;


	/// Sets this Rects xMin value. If the value given is greater
	/// than the existing xMax value, then this value will become
	/// the new max value, and the old max will become the new min.
	void set xMin(num val){
		if(val > _xMax){
			_xMin = _xMax;
			_xMax = val;
		}
		else _xMin = val;
	}
	/// Sets this Rects xMin value. If the value given is greater
	/// than the existing xMax value, then this value will become
	/// the new max value, and the old max will become the new min.
	void set yMin(num val){
		if(val > _yMax){
			_yMin = _yMax;
			_yMax = val;
		}
		else _yMin = val;
	}
	/// Sets this Rects xMin value. If the value given is greater
	/// than the existing xMax value, then this value will become
	/// the new max value, and the old max will become the new min.
	void set xMax(num val){
		if(val < _xMin){
			_xMax = _xMin;
			_xMin = val;
		}
		else _xMax = val;
	}
	/// Sets this Rects xMin value. If the value given is greater
	/// than the existing xMax value, then this value will become
	/// the new max value, and the old max will become the new min.
	void set yMax(num val){
		if(val < _yMin){
			_yMax = _yMin;
			_yMax = val;
		}
		else _xMax = val;
	}

	/// Gets the width of this Rect.
	num get width => xMax - xMin;

	/// Gets the height of this Rect.
	num get height => yMax - yMin;

	/// Spatial equality between two rectangles, invoked with the '==' operator.
	bool operator  ==(Rect that) => (
		(xMin == that.xMin) &&
		(xMax == that.xMax) &&
		(yMin == that.yMin) &&
		(yMax == that.yMax)
	);

	/// Returns true if this rectangle contains the given point.
	bool contains(Vector point){
		if(point.x < this.xMin) return false;
		if(point.x > this.xMax) return false;
		if(point.y < this.yMin) return false;
		if(point.y > this.yMax) return false;
		return true;
	}

	/// Returns true if this Rect overlaps that Rect, and false otherwise.
	bool overlaps(Rect that){
		if(xMax < that.xMin) return false;
		if(xMin > that.xMax) return false;
		if(yMax < that.yMin) return false;
		if(yMin > that.yMax) return false;
		return true;
	}

	/// Returns the smallest or tightest fitting rectangle containing both this Rect and that Rect.
	Rect union(Rect that){
		var union = new Rect(
			min(xMin, that.xMin),
			min(yMin, that.yMin),
			max(xMax, that.xMax),
			max(yMax, that.yMax)
		);
		return union;
	}

	Rect get boundingBox => new Rect(xMin, yMin, xMax, yMax);

	/// Returns a string representation of this Rect.
	String toString() => 'Rect: ($xMin, $yMin), ($xMax, $yMax)}';

}