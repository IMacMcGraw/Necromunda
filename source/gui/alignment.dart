
part of gui;

class Alignment{

	final int value;
	final String name;

	const Alignment._internal(this.value, this.name);

	static const topLeft = const Alignment._internal(0, 'topLeft');
	static const topCenter = const Alignment._internal(1, 'topCenter');
	static const topRight = const Alignment._internal(2, 'topRight');

	static const midLeft = const Alignment._internal(3, 'midLeft');
	static const midCenter = const Alignment._internal(4, 'midCenter');
	static const midRight = const Alignment._internal(5, 'midRight');

	static const bottomLeft = const Alignment._internal(6, 'bottomLeft');
	static const bottomCenter = const Alignment._internal(7, 'bottomCenter');
	static const bottomRight = const Alignment._internal(8, 'bottomRight');

	/// Returns values: 0(left), 0.5(center), 1(right)
	double get horizontalShift => (value%3)/2;
	/// Return values: 0(top), 0.5(mid), 1(bottom)
	double get verticalShift => (value~/3)/2;


	bool operator ==(Alignment that) => value == that.value;

}