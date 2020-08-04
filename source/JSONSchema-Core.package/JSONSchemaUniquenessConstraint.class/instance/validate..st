validation
validate: anArray
	(uniqueItems notNil and: [ uniqueItems ])
		ifTrue: [ anArray size = anArray asSet size
				ifFalse: [ JSONConstraintError
						signal: anArray , ' must not contain doublet elements' ] ]