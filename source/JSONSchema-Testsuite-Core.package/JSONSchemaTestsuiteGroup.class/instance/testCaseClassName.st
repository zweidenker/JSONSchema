accessing
testCaseClassName
	^ testCaseClassName
		ifNil:
			[ testCaseClassName := #JSONSchema , self cleanedDescription , #Tests ]