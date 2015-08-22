
library practiceTest;

import './dartTest/dartTest.dart';

main(){

	new Framework('Practice framework', [
		new Module('Practice module', [
			new Group('PracticeGroup', [

				new Test('True is true', () => expectTrue(true)),

				new Test('False is true', () =>expectTrue(false)),

				new Test('1 equals 1', () => assertThat(1, equals, 1)),

				new Test('1 equals 0', () => assertThat(1, equals, 0))

			])
		])
	]);

}