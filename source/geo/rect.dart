
part of geo;

class Rect implements Shape2D{

	num x, y, w, h;

	Rect(this.x, this.y, this.w, this.h);
	Rect.byVector(Vector origin, Vector dimensions) : this(origin.x, origin.y, dimensions.x, dimensions.y);
	Rect.zero() : this(.0,.0,.0,.0);

	Vector get origin       => new Vector(x, y);
	Vector get dimensions   => new Vector(w, h);
	set origin(Vector v)    { x = v.x; y = v.y; }
	set dimensions(Vector v){ w = v.x; h = v.y;	}


	// It is possible that w and h are negative values?
	num get left    => math.min(x, x + w);
	num get right   => math.max(x, x + w);
	num get top     => math.min(y, y + h);
	num get bottom  => math.max(y, y + h);

	/// Will drag this rectangles left edge to the specified x-coordinate.
	// TODO: Make these methods work for positive and negative widths and heights.
	void set left(num l){
		w += x - l;
		x = l;
	}
	/// Will drag this rectangles right edge to the specified x-coordinate.
	void set right(num r){
		w = r - x;
	}
	/// Will drag this rectangles top edge to the specified y-coordinate.
	void set top(num t){
		h += y -t;
		y = t;
	}
	/// Will drag this rectangles bottom edge to the specified y-coordinate.
	void set bottom(num b){
		h = y - b;
	}

	/// Value equality between two rectangles, invoked with the '==' operator.
	bool operator  ==(Rect that) => ((x==that.x)&&(y==that.y)&&(w==that.w)&&(h==that.h));

	///
	bool contains(Vector point){
		if(point.x < this.left) return false;
		if(point.x > this.right) return false;
		if(point.y < this.top) return false;
		if(point.y > this.bottom) return false;
		return true;
	}

	/// Returns true if this rectangle overlaps rect b, and false otherwise.
	bool overlaps(Rect that){
		if(right < that.left) return false;
		if(left > that.right) return false;
		if(bottom > that.top) return false;
		if(top < that.bottom) return false;
		return true;
	}

	/// Returns the union of this rectangle and rect b: the smallest rectangle that contains both of them.
	Rect union(Rect b){
		var union = new Rect.zero();
		union.left = math.min(left, b.left);
		union.right = math.max(right, b.right);
		union.top = math.min(top, b.top);
		union.bottom = math.max(bottom, b.bottom);
		return union;
	}

	/// Returns a string representation of this object.
	String toString() => 'Rect: ($x, $y), $w x $h';

}