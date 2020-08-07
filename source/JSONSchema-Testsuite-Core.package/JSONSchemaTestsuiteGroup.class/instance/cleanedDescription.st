private
cleanedDescription
	^ ''
		join:
			(([ :character | character isAlphaNumeric not ] split: description)
				collect: [ :each | each capitalized ])