tests
testReadObject
	| schema value |
	"schema := JSONSchemaObject new 
		properties: { 
			#foo -> JSONSchema string } asDictionary."
	schema := { #foo -> #string } asJSONSchema.
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "bar" }' ]
		raise: JSONTypeError.
		
	self assert: (value includesKey: #foo) 
