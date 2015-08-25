
part of visible;

class Circle extends geo.Circle implements Visible{

	final Surface surface;
	Colour colour;

	Circle(this.surface, num x, num y, num radius, this.colour){


	}
}