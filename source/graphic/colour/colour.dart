
library colour;

class Colour{

	double _h, _s, _l, _a;

	double get h => _h;
	double get s => _s;
	double get l => _l;
	double get a => _a;

	_unitClamp(double x) => x.clamp(0, 1);
	set h(double x) => _h = _unitClamp(x);
	set s(double x) => _s = _unitClamp(x);
	set l(double x) => _l = _unitClamp(x);
	set a(double x) => _a = _unitClamp(x);

	/// All values are measured on a scale from 0 -> 1.
	Colour(h, s, l, a){
		this.h = h;
		this.s = s;
		this.l = l;
		this.a = a;
	}

	// Conversion methods for the canvas stroke and fill methods.
	int get degreesH => (360*h).toInt();
	int get percentS => (100*s).toInt();
	int get percentL => (100*s).toInt();

	static Colour get white => new Colour(0, 0, 1, 1);
	static Colour get black => new Colour(0, 0, 0, 1);
	static Colour get clear => new Colour(0, 0, 0, 0);

}