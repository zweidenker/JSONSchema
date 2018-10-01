instance creation
named: aString
	^ self allSubclasses 
		detect: [ :each | each constraintName = aString ]