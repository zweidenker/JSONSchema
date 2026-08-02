Class {
	#name : 'JSONSchemaTests',
	#superclass : 'TestCase',
	#category : 'JSONSchema-Core-Tests',
	#package : 'JSONSchema-Core-Tests'
}

{ #category : 'tests' }
JSONSchemaTests >> testAdditionalPropertiesFalseEnforcedWithoutPatternProperties [
	"Regression: JSONSchemaPatternPropertiesConstraint (the constraint that enforces
	additionalProperties) only activated when patternProperties was present -
	validate:'s own logic already handled the no-patternProperties case correctly, it
	just never got attached. A properties-only schema with additionalProperties:false
	silently accepted extra properties. Found 2026-08-02 via the RecurringEvents schema
	(schema/recurring-events.schema.json)."
	| schema |
	schema := JSONSchema fromString: '{"type":"object","properties":{"foo":{"type":"string"}},"required":["foo"],"additionalProperties":false}'.
	self shouldnt: [ schema validate: {'foo'->'bar'} asDictionary ] raise: Error.
	self should: [ schema validate: {'foo'->'bar'. 'extra'->1} asDictionary ] raise: JSONTypeError
]

{ #category : 'tests' }
JSONSchemaTests >> testAllOfCompositionMergesRequiredAcrossBranches [
	| definition schema |
	definition := JSONSchemaDefinition new
		allOf: {
			(JSONSchemaDefinition new properties: { 'name' -> (JSONSchemaDefinition new typeString: 'string'; yourself) } asDictionary; required: #('name'); yourself).
			(JSONSchemaDefinition new properties: { 'id' -> (JSONSchemaDefinition new typeString: 'integer'; yourself) } asDictionary; required: #('id'); yourself) };
		yourself.
	schema := definition asJSONSchema.
	self should: [ schema readString: '{"name":"Rex"}' ] raise: JSONTypeError
]

{ #category : 'tests' }
JSONSchemaTests >> testAllOfCompositionOfObjectSchemasMergesPropertiesForReading [
	"A bare allOf of object-shaped branches (no direct type/properties keyword) resolves
	to JSONSchemaAnyObject via #asJSONSchema since nothing sets schemaClass for a bare
	allOf - a real-world 'extends' pattern (e.g. OpenAPI's Pet = allOf[NewPet, {id}]).
	Reading against it must merge all branches' properties, not raw-passthrough."
	| definition schema result |
	definition := JSONSchemaDefinition new
		allOf: {
			(JSONSchemaDefinition new properties: { 'name' -> (JSONSchemaDefinition new typeString: 'string'; yourself) } asDictionary; yourself).
			(JSONSchemaDefinition new properties: { 'id' -> (JSONSchemaDefinition new typeString: 'integer'; yourself) } asDictionary; yourself) };
		yourself.
	schema := definition asJSONSchema.
	self assert: schema class equals: JSONSchemaAnyObject.
	result := schema readString: '{"id":42,"name":"Rex"}'.
	self assert: result class equals: NeoJSONObject.
	self assert: result id equals: 42.
	self assert: result name equals: 'Rex'
]

{ #category : 'tests' }
JSONSchemaTests >> testAllOfCompositionWithNonObjectBranchFallsBackToPassthrough [
	"Not every allOf is an object composition (e.g. mixing an object schema with a bare
	string schema has no sensible single merged reading target) - must stay a raw
	passthrough rather than guess, exactly like before this fix."
	| definition schema result |
	definition := JSONSchemaDefinition new
		allOf: {
			(JSONSchemaDefinition new properties: { 'name' -> (JSONSchemaDefinition new typeString: 'string'; yourself) } asDictionary; yourself).
			(JSONSchemaDefinition new typeString: 'string'; yourself) };
		yourself.
	schema := definition asJSONSchema.
	self assert: schema mergedAllOfObjectSchema isNil.
	result := schema readString: '{"name":"Rex"}'.
	self assert: result class equals: Dictionary
]

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
JSONSchemaTests >> testPatternPropertiesWithEscapedDotInCharacterClassIsSupported [
	"Regression: the OAI OpenAPI-3.0 meta-schema uses [a-zA-Z0-9\.\-_]+ for component-name
	patternProperties keys (components.schemas/responses/parameters/etc.) - Pharo's Regex
	engine raised 'bad backslash escape' on the escaped dot inside the character class."
	| schema |
	schema := JSONSchema fromString: '{"type":"object","patternProperties":{"^[a-zA-Z0-9\\.\\-_]+$":{"type":"string"}},"additionalProperties":false}'.
	self shouldnt: [ schema validate: {'Foo.Bar-1_2'->'ok'} asDictionary ] raise: Error.
	self should: [ schema validate: {'has space'->'ok'} asDictionary ] raise: JSONSchemaError
]

{ #category : 'tests' }
JSONSchemaTests >> testPatternPropertiesWithNonCapturingGroupIsSupported [
	"Same regression as #testPatternWithNonCapturingGroupIsSupported, but for the
	patternProperties keyword (matches property *names*, separate code path/call site)."
	| schema |
	schema := JSONSchema fromString: '{"type":"object","patternProperties":{"^[1-5](?:\\d{2}|XX)$":{"type":"string"}},"additionalProperties":false}'.
	self shouldnt: [ schema validate: {'200'->'ok'} asDictionary ] raise: Error.
	self shouldnt: [ schema validate: {'2XX'->'ok'} asDictionary ] raise: Error.
	self should: [ schema validate: {'999'->'ok'} asDictionary ] raise: JSONSchemaError
]

{ #category : 'tests' }
JSONSchemaTests >> testPatternWithNonCapturingGroupIsSupported [
	"Regression: the OAI OpenAPI-3.0 meta-schema's Responses object uses the pattern
	'^[1-5](?:\d{2}|XX)$' - Pharo's Regex engine used to raise 'Invalid lookaround
	expression ?:' on the (?:...) syntax, crashing any validation that hit it."
	| schema |
	schema := JSONSchema fromString: '{"type":"string","pattern":"^[1-5](?:\\d{2}|XX)$"}'.
	self shouldnt: [ schema validate: '200' ] raise: Error.
	self shouldnt: [ schema validate: '2XX' ] raise: Error.
	self should: [ schema validate: '999' ] raise: JSONConstraintError
]

{ #category : 'tests' }
JSONSchemaTests >> testReadDoesNotApplyFormatConstraintToNonStringValues [
	"Regression: JSONPrimitiveSchema>>read: used to call every attached constraint's
	validate: unconditionally, without first checking validateType: (unlike JSONSchema>>
	validate:, which correctly gates on it). JSONSchemaFormatConstraint>>validateType:
	says format only applies to strings, but its validate: still got called on any value -
	crashing for numeric formats like int32/int64 (format validateString: anInteger)."
	| schema |
	schema := JSONSchema fromString: '{"type":"integer","format":"int64"}'.
	self shouldnt: [ schema readString: '42' ] raise: Error.
	self assert: (schema readString: '42') equals: 42
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

{ #category : 'tests' }
JSONSchemaTests >> testValidateAcceptsValidDateTimeStringOnExplicitlyTypedSchema [
	"Regression: JSONPrimitiveSchema>>validate: (a leftover from before the generic
	JSONSchemaFormatConstraint - Tier G - existed) called the format class's own
	validate: with the raw JSON string. JSONFormatDateTime/JSONFormatDate/JSONFormatURI's
	class-side validate: expect an already-converted value (DateAndTime/Date/ZnUrl, as
	produced by the read: pipeline), so this crashed with a bogus JSONTypeError for
	*every* valid date-time/date/uri string whenever type was explicit alongside
	format - JSONSchemaFormatConstraint's own validateString: (which does the real,
	correct check against the raw string) already covers this generically, making the
	call redundant as well as wrong. Found 2026-08-02 via the RecurringEvents schema,
	where e.g. dateAndTime declares type:string/format:date-time for its at property."
	| schema |
	schema := JSONSchema fromString: '{"type":"string","format":"date-time"}'.
	self shouldnt: [ schema validate: '2026-01-01T00:00:00Z' ] raise: Error.
	self should: [ schema validate: 'not-a-date' ] raise: JSONConstraintError
]
