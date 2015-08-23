
part of dartTest;

class expect{
	static void isTrue(bool statement){
		if(!statement){
			var anomaly = new _anomaly('Expected true statement is false.');
			Test._addEntry(anomaly);
		}
	}
	static void isFalse(bool statement){
		if(statement){
			var anomaly = new _anomaly('Expected false statement is true.');
			Test._addEntry(anomaly);
		}
	}
	static void areEqual(actual, expected){
		if(actual != expected){
			var anomaly = new _anomaly('$actual does not equal $expected');
			Test._addEntry(anomaly);
		}
	}
	static void areUnequal(actual, expected){
		if(actual == expected){
			var anomaly = new _anomaly('Expected unequal values are equal.');
			Test._addEntry(anomaly);
		}
	}
	static void valuesEqual(num actual, num expected, {num tolerance}){
		if(tolerance == null) tolerance = 0;

		if((actual >= expected + tolerance) || (actual <= expected - tolerance)){
			var anomaly = new _anomaly('$actual does not equal $expected');
		}
	}
}