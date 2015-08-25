
part of events;

typedef dynamic Callback<T>(T);

class _Listener<T>{
	final int priority;
	final Callback<T> callback;
	const _Listener(this.callback, this.priority);
}

class Source<T>{

	final Stream<T> stream;
	bool get interceptable => stream._interceptable;
	bool get ascendingPriority => stream._ascendingPriority;

	Source({ascendingPriority: false, interceptable: false})
		: stream = new Stream<T>._internal(ascendingPriority, interceptable);

	/// Dispatches the signal to all listeners. A callback return value of true
	/// will terminate the dispatch process, if this dispatcher can be intercepted.
	bool dispatch([T signal]){
		for(var listener in stream._ledger){
			if(listener.callback(signal) && interceptable) return true;
		}
		return false;
	}

}

class Stream<T>{
	bool _ascendingPriority;
	bool get ascendingPriority => _ascendingPriority;

	bool _interceptable;
	bool get interceptable => _interceptable;

	Stream._internal(this._ascendingPriority, this._interceptable);

	final List<_Listener<T>> _ledger = new List<_Listener<T>>();

	/// Add a listener to this stream. Listeners are invoked in order of descending
	/// priority. If a stream is interceptable, then the invocation of listeners is
	/// terminated by the first listener to return 'true'.
	void addListener(Callback<T> callback, {int priority: 0}){
		_ledger.add(new _Listener(callback, priority));
		_sortEntries();
	}

	/// Remove a listener from this stream.
	void removeListener(Callback<T> callback){
		_ledger.removeWhere( (listener) => listener.callback == callback );
	}

	void addBranch(Source<T> source, {int priority: 0}){
		_ledger.add( new _Listener(source.dispatch, priority));
		_sortEntries();
	}

	void removeBranch(Source<T> source){
		_ledger.removeWhere( (listener) => listener.callback == source.dispatch );
	}

	_sortEntries(){
		var sortOrder = ascendingPriority? 1 : -1;
		_ledger.sort( (_Listener a, _Listener b) => sortOrder*a.priority.compareTo(b.priority) );
	}
}