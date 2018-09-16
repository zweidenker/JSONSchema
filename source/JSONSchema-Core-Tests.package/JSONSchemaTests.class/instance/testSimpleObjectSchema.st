tests
testSimpleObjectSchema
	| schemaSpec object |
	schemaSpec := JSONSchemaSpec new 
		typeString: 'object';
		properties: { 
			#foo -> JSONSchema string.
			#bar -> JSONSchema integer } asDictionary.
	object := schemaSpec schema readFrom: (NeoJSONReader fromString: '{ "foo" : "123", "bar" : 123 }').
	self assert: object foo equals: '123'.
	self assert: object bar equals: 123