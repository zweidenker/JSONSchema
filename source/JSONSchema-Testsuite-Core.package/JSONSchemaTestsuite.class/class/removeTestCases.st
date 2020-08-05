actions
removeTestCases
	[ :job | 
	| classes |
	classes := JSONSchemaTestsuiteTestCase allSubclasses.
	job
		title: 'Cleaning up...';
		max: classes size.
	classes
		do: [ :each | 
			each removeFromSystem.
			job increment ].
	self removeTestsPackage ] asJob run