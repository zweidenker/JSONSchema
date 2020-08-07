private
identifierFromString: aString
	^ ''
		join:
			(([ :character | character isAlphaNumeric not ] split: aString)
				collect: [ :each | each capitalized ])