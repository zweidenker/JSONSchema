Class {
	#name : 'JSONSchemaDefinitionTests',
	#superclass : 'TestCase',
	#category : 'JSONSchema-Core-Tests',
	#package : 'JSONSchema-Core-Tests'
}

{ #category : 'tests' }
JSONSchemaDefinitionTests >> parse: aString [
	^ (JSONSchemaDefinition fromString: aString) asJSONSchema.
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testArrayItemsDefinition [
	| schema string |
	string := '{"type":"array","minItems":2,"maxItems":3}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaArray.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testArrayMultipleItemsDefinition [
	| schema |
	schema := JSONSchemaArray new
		items: { JSONSchema integer . JSONSchema string }.
	
	self 
		shouldnt: [ 
		 schema validate: { 3 . #foo } ]
		raise: JSONTypeError 
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testArrayMultipleItemsDefinitionDifferentSizes [
	"Per JSON-Schema spec a tuple (items as an array of schemas) applies positionally;
	an instance shorter than the tuple is valid (the missing positions are simply
	unconstrained), and extra items are governed by additionalItems. So a 2-element
	array against a 3-schema tuple validates as long as the present positions match."
	| schema |
	schema := JSONSchemaArray new
		items: { JSONSchema integer . JSONSchema string . JSONSchema boolean }.

	self shouldnt: [ schema validate: { 3 . 'foo' } ] raise: JSONTypeError.
	"a wrong type at a present position still fails"
	self should: [ schema validate: { 'bar' . 'foo' } ] raise: JSONTypeError
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testArrayUniquenessDefinition [
	| schema string |
	string := '{"type":"array","uniqueItems":true}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaArray.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testArrayWithMaxItems [
	| schema value |
	schema := JSONSchema fromString: '{
	"type": "array",
   "items": {"type": "string"},
   "maxItems": 2
}'.
	self 
		shouldnt: [ value := schema validate: { 'bar' } ]
		raise: Error.
		

]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testArrayWithMaxItemsFail [
	| schema value |
	schema := JSONSchema fromString: '{
	"type": "array",
   "items": {"type": "string"},
   "maxItems": 2
}'.
	self 
		should: [ value := schema validate: { 'bar'. 'foo' . 'baz' } ]
		raise: Error.
		

]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testArrayWithMinItems [
	| schema value |
	schema := JSONSchema fromString: '{
	"type": "array",
   "items": {"type": "string"},
   "minItems": 1
}'.
	self 
		shouldnt: [ value := schema validate: { 'bar' } ]
		raise: Error.
		

]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testArrayWithMinItemsFail [
	| schema value |
	schema := JSONSchema fromString: '{
	"type": "array",
   "items": {"type": "string"},
   "minItems": 2
}'.
	self 
		should: [ value := schema validate: { 'foo' } ]
		raise: Error.
		

]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testArrayWithNoItemsSpec [
	| schema value |
	schema := JSONSchema fromString: '{"type": "array"}'.
	self 
		shouldnt: [ value := schema readString: '[ 1, 2, 3 , "foo", { "bar" : "baz" }, 4 ]' ]
		raise: Error.
		
	self assert: value size equals: 6.
	self assert: value first isNumber.
	self assert: value fourth isString.
	self assert: value fifth isDictionary.
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testEnumDefinition [
	| schema string |
	string := '{"type":"string","enum":["one","two","three"]}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaString.
	self assert: schema jsonString equals: string
	
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testNoTypeWithConstraints [
	| schema |
	schema := JSONSchema fromString: '{"exclusiveMaximum":10}'.

	self 
		should: [ schema validate: 11 ]
		raise: JSONConstraintError.
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testNumberIntervalDefinition [
	| schema string |
	string := '{"type":"number","minimum":2,"maximum":15}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaNumber.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testNumberIntervalExclusiveDefinition [
	| schema string |
	string := '{"type":"number","exclusiveMinimum":2,"exclusiveMaximum":15}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaNumber.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testNumberMultipleOfDefinition [
	| schema string |
	string := '{"type":"number","multipleOf":2}'.
	schema := self parse: string.

	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaNumber.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testObjectSizeDefinition [
	| schema string |
	string := '{"type":"object","minProperties":2,"maxProperties":3}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaObject.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testSimpleArrayDefinition [
	|  schema string |
	string := '{"type":"array"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaArray.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testSimpleBooleanDefinition [
	| schema string |
	string := '{"type":"boolean"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaBoolean.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testSimpleIntegerDefinition [
	|  schema string |
	string := '{"type":"integer"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaInteger.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testSimpleNullDefinition [
	| schema string |
	string := '{"type":"null"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaNull.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testSimpleNumberDefinition [
	| schema string |
	string := '{"type":"number"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaNumber.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testSimpleObjectDefinition [
	| schema string |
	string := '{"type":"object"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaObject.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testSimpleStringDefinition [
	| definition schema string |
	string := '{"type":"string"}'.
	definition := JSONSchemaDefinition fromString: string.
	schema := definition asJSONSchema.
	self assert: schema class equals: JSONSchemaString.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testStringDefinition [
	| schema string |
	string := '{"type":"string"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaString.
	self assert: schema jsonString equals: string
]

{ #category : 'tests' }
JSONSchemaDefinitionTests >> testStringLengthDefinition [
	| schema string |
	string := '{"type":"string","minLength":2,"maxLength":15}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaString .
	self assert: schema jsonString equals: string
]
