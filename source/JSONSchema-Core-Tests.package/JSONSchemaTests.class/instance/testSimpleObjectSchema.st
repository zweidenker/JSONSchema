tests
testSimpleObjectSchema
	| schemaSpec object |
	schemaSpec := JSONSchemaDefinition new 
		typeString: 'object';
		properties: { 
			#foo -> JSONSchema string.
			#bar -> JSONSchema integer } asDictionary.
	object := schemaSpec schema readString: '{ "foo" : "123", "bar" : 123 }'.
	self assert: object foo equals: '123'.
	self assert: object bar equals: 123