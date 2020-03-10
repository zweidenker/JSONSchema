tests
testReadBooleanTypeString
	| value |
	self 
		shouldnt: [ value := JSONSchemaBoolean readString: 'true' ]
		raise: JSONTypeError.
	self assert: value equals: true 
