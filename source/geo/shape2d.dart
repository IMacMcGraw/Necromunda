
part of geo;

/// Provides an interface for many classes in geo.dart.
abstract class Shape2D{
	/// Returns the bounding box of this 2-dimensional shape.
	Rect get boundingBox;
}