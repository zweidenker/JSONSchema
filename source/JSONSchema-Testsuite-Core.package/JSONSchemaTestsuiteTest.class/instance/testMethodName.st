accessing
testMethodName
	^ testMethodName
		ifNil: [ | cleanedDescription |
			cleanedDescription := ''
				join:
					(([ :character | character isAlphaNumeric not ] split: description)
						collect: [ :each | each capitalized ]).
			testMethodName := 'test' , cleanedDescription ]