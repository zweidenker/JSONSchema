as yet unclassified
schemaClass: aClass 
	(schemaClass isNil | (schemaClass = aClass)) ifFalse: [
		Error signal: 'schema class is incompatible' ].
	schemaClass := aClass