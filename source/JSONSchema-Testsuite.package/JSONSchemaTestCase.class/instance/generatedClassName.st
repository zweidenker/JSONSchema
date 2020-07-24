as yet unclassified
generatedClassName
	| cleanedName |
	cleanedName := ''
		join:
			(([ :character | character isAlphaNumeric not ] split: name)
				collect: [ :each | each capitalized ]).
	^ #JSONSchema , cleanedName , #Tests