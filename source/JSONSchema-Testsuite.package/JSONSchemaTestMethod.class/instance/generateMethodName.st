as yet unclassified
generateMethodName
	| cleanedDescription |
	cleanedDescription := ''
		join:
			(([ :character | character isAlphaNumeric not ] split: description)
				collect: [ :each | each capitalized ]).
	^ 'test' , cleanedDescription