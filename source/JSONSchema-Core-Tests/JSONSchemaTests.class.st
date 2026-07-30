Class {
	#name : 'JSONSchemaTests',
	#superclass : 'TestCase',
	#category : 'JSONSchema-Core-Tests',
	#package : 'JSONSchema-Core-Tests'
}

{ #category : 'tests' }
JSONSchemaTests >> testMultipleConstraintsOnAnyObject [
	| schema |
	schema := JSONSchema
		fromString:
			'{"minProperties":2,"maxProperties":2,"minItems":4,"maxItems":4,"minLength":6,"maxLength":6}'.
	self
		should: [ schema validate: {'a'->1} asDictionary  ] raise: JSONConstraintError;
		shouldnt: [ schema validate:  {'a'->1. 'b' ->2} asDictionary  ] raise: JSONConstraintError;
		should: [ schema validate: {'a'->1. 'b' ->2. 'c'->3} asDictionary] raise: JSONConstraintError.
	self
		should: [ schema validate: #(1 2 3) ] raise: JSONConstraintError;
		shouldnt: [ schema validate: #(1 2 3 4) ] raise: JSONConstraintError;
		should: [ schema validate: #(1 2 3 4 5) ] raise: JSONConstraintError.
	self
		should: [ schema validate: '12345' ] raise: JSONConstraintError;
		shouldnt: [ schema validate: '123456' ] raise: JSONConstraintError;
		should: [ schema validate: '1234567' ] raise: JSONConstraintError
]

{ #category : 'tests' }
JSONSchemaTests >> testSchemaReadArray [

	| schema object|
	schema := {
	#foo -> (JSONSchemaArray new items: (JSONSchema string formatString: 'date-time')).
	} asJSONSchema.
	
	object := schema readString: '{"foo":["2018-10-09T13:15:08+01:00","2019-10-09T13:15:08+01:00"]}'.
	
	self assert: object foo first equals: (DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).
	self assert: object foo second equals: (DateAndTime year: 2019 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).	
]

{ #category : 'tests' }
JSONSchemaTests >> testSchemaReadArrayMultipleItems [

	| schema object|
	schema := {
	#foo -> (JSONSchemaArray new items: {
		JSONSchema integer.
		JSONSchema string.
		JSONSchema string formatString: 'date-time' }).
	} asJSONSchema.
	
	object := schema readString: '{"foo":[3,"foobar","2019-10-09T13:15:08+01:00"]}'.
	
	self assert: object foo first equals: 3.
	self assert: object foo second equals: #foobar.
	self assert: object foo third equals: (DateAndTime year: 2019 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).	
]

{ #category : 'tests' }
JSONSchemaTests >> testSchemaReadArrayPropertyThatIsNull [
	"A schema saying a property is an array does not forbid the actual
	value being JSON null - readString: must not crash trying to parse
	null as a list."
	| schema object |
	schema := {
		#foo -> (JSONSchemaArray new items: JSONSchema string).
	} asJSONSchema.
	object := schema readString: '{"foo":null}'.
	self assert: object foo equals: nil
]

{ #category : 'tests' }
JSONSchemaTests >> testSchemaReadArrayPropertyThatIsWrongType [
	"A literal true/false where an array was expected is invalid JSON for
	this schema and should raise a clear type error, not an obscure parser
	error from trying to read it as a list."
	| schema |
	schema := {
		#foo -> (JSONSchemaArray new items: JSONSchema string).
	} asJSONSchema.
	self should: [ schema readString: '{"foo":true}' ] raise: JSONTypeError
]

{ #category : 'tests' }
JSONSchemaTests >> testSchemaReadNested [

	| schema object |
	schema := {
	#foo -> (JSONSchema string formatString: 'date-time').
	#bar -> { 
		#one -> JSONSchema string }  
	} asJSONSchema.
	
	object := schema readString: '{"foo":"2018-10-09T13:15:08+01:00","bar":{"one":"two"}}'.
	self assert: object foo equals: (DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).
	self assert: object bar equals: ({ #one -> #two } as: NeoJSONObject)

	

]

{ #category : 'tests' }
JSONSchemaTests >> testSchemaReadNestedObjectPropertyThatIsNull [
	"Same as above for an object-typed property."
	| schema object |
	schema := {
		#bar -> { #one -> JSONSchema string }
	} asJSONSchema.
	object := schema readString: '{"bar":null}'.
	self assert: object bar equals: nil
]

{ #category : 'tests' }
JSONSchemaTests >> testSchemaWriteArray [

	| schema object value date1 date2 |
	schema := {
	#foo -> (JSONSchemaArray new items: (JSONSchema string formatString: 'date-time')).
	} asJSONSchema.
	
	date1 := DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour.
	date2 := DateAndTime year: 2019 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour.
	
	object := { 
		#foo -> {date1. date2}
		} as: NeoJSONObject.

	value := schema write: object.
	
	self assert: value equals: '{"foo":["2018-10-09T13:15:08+01:00","2019-10-09T13:15:08+01:00"]}'
]

{ #category : 'tests' }
JSONSchemaTests >> testSchemaWriteArrayMultipleItems [

	| schema object value date |
	schema := {
	#foo -> (JSONSchemaArray new items: {
		JSONSchema integer.
		JSONSchema string.
		JSONSchema string formatString: 'date-time' }).
	} asJSONSchema.
	
	date := DateAndTime year: 2019 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour.
	
	object := { 
		#foo -> { 3 . #foobar.  date}
		} as: NeoJSONObject.

	value := schema write: object.
	
	self assert: value equals: '{"foo":[3,"foobar","2019-10-09T13:15:08+01:00"]}'
]

{ #category : 'tests' }
JSONSchemaTests >> testSchemaWriteNested [

	| schema object value |
	schema := {
	#foo -> (JSONSchema string formatString: 'date-time').
	#bar -> { 
		#one -> JSONSchema string }  
	} asJSONSchema.
	
	
	object := { 
		#foo -> (DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour).
		#bar -> ({ #one -> #two } as: NeoJSONObject) } as: NeoJSONObject.

	value := schema write: object.
	
	self assert: value equals: '{"foo":"2018-10-09T13:15:08+01:00","bar":{"one":"two"}}'
]

{ #category : 'tests' }
JSONSchemaTests >> testSimpleObjectSchema [
	| schemaSpec object |
	schemaSpec := JSONSchemaDefinition new 
		typeString: 'object';
		properties: { 
			#foo -> JSONSchema string.
			#bar -> JSONSchema integer } asDictionary.
	object := schemaSpec asJSONSchema readString: '{ "foo" : "123", "bar" : 123 }'.
	self assert: object foo equals: '123'.
	self assert: object bar equals: 123
]
