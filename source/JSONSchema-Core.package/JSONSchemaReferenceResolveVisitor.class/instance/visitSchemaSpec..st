as yet unclassified
visitSchemaSpec: aSchemaSpec
	^ aSchemaSpec isReference 
		ifTrue: [ self visit: aSchemaSpec reference ]
		ifFalse: [ self visit: aSchemaSpec asJSONSchema ]