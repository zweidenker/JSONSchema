actions
generateTestCases
	^ self new
		generateTestCases;
		generateExpectedFailures;
		validateGeneratedTestCases