
part of events;

typedef dynamic Callback<T extends Signal>(T);

class _Listener<T extends Signal>{
	final int priority;
	final Callback<T> callback;
	const _Listener(this.callback, this.priority);
}

class Dispatcher<T extends Signal>{

	final Sequence<T> sequence;
	bool get interceptable => sequence.interceptable;

	Dispatcher({interceptable: false})
		: sequence = new Sequence<T>._internal(interceptable);

	/// Dispatches the signal to all listeners. A callback return value of true
	/// will terminate the dispatch process, if this dispatcher can be intercepted.
	bool dispatch({T signal, bool reversePriority: false}){

		var tempList = reversePriority? sequence._ledger.reversed : sequence._ledger;
		for(var listener in tempList){
			if(listener.callback(signal) && interceptable) return true;
		}
		return false;
	}
}


class Sequence<T extends Signal>{
	final bool interceptable;
	Sequence._internal(this.interceptable);

	final List<_Listener<T>> _ledger = new List<_Listener<T>>();

	/// Add the callback as a listener to this stream with the given priority level.
	///
	void addListener(Callback<T> callback, {int priority: 0}){
		_ledger
			..add(new _Listener(callback, priority))
			// Sort with negative prefixes for descending order.
			..sort( (_Listener a, _Listener b) => (-a.priority).compareTo(-b.priority) );
	}

	// Remove the given callback as a listener to this stream.
	void removeListener(Callback<T> callback){
		_ledger.removeWhere( (listener) => listener.callback == callback );
	}
}