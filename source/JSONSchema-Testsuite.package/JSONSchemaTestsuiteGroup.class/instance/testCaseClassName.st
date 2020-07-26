accessing
testCaseClassName
	^ testCaseClassName
		ifNil: [ | cleanedDescription |
			cleanedDescription := ''
				join:
					(([ :character | character isAlphaNumeric not ] split: description)
						collect: [ :each | each capitalized ]).
			testCaseClassName := #JSONSchema , cleanedDescription , #Tests ]