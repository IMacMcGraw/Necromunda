
part of dartTest;

void assertThat(dynamic actual, Relation relation, dynamic expected, {num tolerance}){

	var pass, message = '';

	// Numerical case:
	if( (actual is num)&&(expected is num) ){
		if(tolerance == null) tolerance = 0;
		switch(relation){
			case equals:
				pass = (actual <= expected + tolerance) && (actual >= expected - tolerance);
				break;
			case greaterThan:
				pass = (actual > expected);
				break;
			case lessThan:
				pass = (actual < expected);
				break;
			case greaterThanOrEqualTo:
				pass = (actual >= expected);
				break;
			case lessThanOrEqualTo:
				pass = (actual <= expected+tolerance);
				break;
			default:
				pass = false;
				break;
		}
	}
	// String case:
	else if( (actual is String)&&(expected is String) ){
		pass = (relation == equals)? (actual == expected) : false;
	}
	// General instance case:
	else{
		var actualMirror = mirror.reflect(actual);
		var expectedMirror = mirror.reflect(expected);
	}
	if(!pass){ _failTest('$actual is not ${relationToString[relation]} $expected'); }
}

void expectTrue(bool statement){
	if(!statement) _failTest('Statement is false');
}

void _failTest(String message){
	Test._addResultToCurrentTest(new _Result(false, message));
	try{ throw new Exception('Test ${Test._currentTest._name} failed.'); }
	catch(exception, stackTrace){
		print(exception);
		print(stackTrace);
	}
}


enum Relation{
	equals,
	greaterThan,
	lessThan,
	greaterThanOrEqualTo,
	lessThanOrEqualTo,
	instanceOf,
	isTrue
}

const equals = Relation.equals;
const greaterThan = Relation.greaterThan;
const lessThan = Relation.lessThan;
const greaterThanOrEqualTo = Relation.greaterThanOrEqualTo;
const lessThanOrEqualTo = Relation.lessThanOrEqualTo;
const instanceOf = Relation.instanceOf;

final Map<int, String> relationToString = {
	equals: 'equal to',
	greaterThan: 'greater than',
	lessThan: 'less than',
	greaterThanOrEqualTo: 'greater than or equal to',
	lessThanOrEqualTo: 'less than or equal to',
	instanceOf: 'instance of'
};