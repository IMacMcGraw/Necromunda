
library geo;

import 'dart:math';
import '../../events/events.dart';


part 'vector.dart';
part 'line.dart';
part 'rect.dart';
part 'polyline.dart';
part 'circle.dart';


// TODO: Should this sort of general functionality be implemented in a more general class?

/// A common superclass for geometric figures.
abstract class Geo{

	/// Returns the bounding box of this geometric figure.
	Rect get boundingBox;

	/// This method can be extended to include any operations that
	/// should be executed when this Geo object has been modified,
	/// for example, requesting a render operation when when its
	/// shape or colour has been changed.
	void modified([Null e]){
		this._modified.dispatch();
	}

	// TODO: Document this well.
	/// Subscribes this geometric figure to the modified events of
	/// its next dependency,
	void replace({Geo prev, Geo next}){
		if(prev != null){
			prev.onModified.removeListener(this.modified);
		}
		next.onModified.addListener(this.modified);
		prev = next;
		this.modified();
	}

	final Source<Null> _modified
		= new Source<Null>();

	Stream<Null> get onModified => _modified.stream;

}