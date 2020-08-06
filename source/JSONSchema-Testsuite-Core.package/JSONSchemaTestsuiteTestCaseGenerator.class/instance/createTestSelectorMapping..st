private
createTestSelectorMapping: aJSONSchemaTestsuiteGroup
	| tests testsBySelector |
	tests := aJSONSchemaTestsuiteGroup tests.
	testSelectorMapping := (tests
		collect: [ :each | each -> (self testMethodSelectorFromTest: each) ])
		asDictionary.
	testsBySelector := tests
		groupedBy: [ :each | (testSelectorMapping at: each) asLowercase ].
	testsBySelector
		select: [ :each | each size > 1 ]
		thenDo: [ :clash | 
			clash
				withIndexDo: [ :test :index | 
					testSelectorMapping
						at: test
						put: (testSelectorMapping at: test) , index printString ] ]