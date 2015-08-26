//import 'dart:convert';
part of events;

/// A mutable class can be modified. It has an onModified event stream,
/// and a modified method, that should be invoked when it has been modified.
/// A mutable class can add another mutable class as a dependency, in which
/// case its onModified event will be invoked when the class on which it depends
/// has been modified.
abstract class Mutable{

	/// This method dispatches the onModified event of this mutable
	/// object, and can be overriden to include any operations that
	/// should be executed when this object has been modified. Be
	/// sure to invoke the super method when overriding, or else this
	/// objects onModified event will not be dispatched.
	void modified([Null e]){
		this._modified.dispatch();
	}

	final Source<Null> _modified
		= new Source<Null>();

	Stream<Null> get onModified => _modified.stream;
}

abstract class DependentMutable extends Mutable{

	//final List<Mutable> _dependencies;// = new List<Mutable>();

	void addDependency(Mutable A){
		A.onModified.addListener(this.modified);
	}

	void removeDependency(Mutable A){
		if(A != null){
			A.onModified.removeListener(this.modified);
		}
	}

	DependentMutable(){

		InstanceMirror instance = reflect(this);
		ClassMirror type = instance.type;

		Map<Symbol, DeclarationMirror> map = type.declarations;

		for(Symbol key in map.keys){



			if(map[key] is VariableMirror){
				print(key);

				print(instance.getField(key).reflectee);
			}
//			MethodMirror property = type.instanceMembers[key];

//			if( property == null ) continue;
//
//			if( property.isGetter && !property.isSynthetic && !property.isPrivate && !property.isRegularMethod){
//
//				print(key);
//
//			}
		}
	}

	void destroy(){
		for(var member in reflect(this).type.declarations.values){
			if( member is Mutable ){
				removeDependency(member);
			}
		}
	}
}