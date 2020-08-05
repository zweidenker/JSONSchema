accessing
cleanedName
	^ ''
		join:
			(([ :character | character isAlphaNumeric not ]
				split: self fileReference basenameWithoutExtension)
				collect: [ :each | each capitalized ])