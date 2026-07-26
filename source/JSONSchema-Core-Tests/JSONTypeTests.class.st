Class {
	#name : 'JSONTypeTests',
	#superclass : 'TestCase',
	#category : 'JSONSchema-Core-Tests',
	#package : 'JSONSchema-Core-Tests'
}

{ #category : 'tests' }
JSONTypeTests >> testReadBooleanType [
	| value |
	self 
		shouldnt: [ value := JSONSchemaBoolean read: true ]
		raise: Exception.
	self assert: value equals: true
]

{ #category : 'tests' }
JSONTypeTests >> testReadBooleanTypeMismatch [
	self 
		should: [ JSONSchemaBoolean new read: 123]
		raise: JSONTypeError.

]

{ #category : 'tests' }
JSONTypeTests >> testReadBooleanTypeString [
	| value |
	self 
		shouldnt: [ value := JSONSchemaBoolean readString: 'true' ]
		raise: JSONTypeError.
	self assert: value equals: true 

]

{ #category : 'tests' }
JSONTypeTests >> testReadDateAndTimeTypeString [
	| value |
	self 
		shouldnt: [ value := JSONSchemaString readString: '2018-10-09T13:15:08+01:00' format: #'date-time' ]
		raise: JSONTypeError.
		self assert: value equals: (DateAndTime fromString: '2018-10-09T13:15:08+01:00') 

]

{ #category : 'tests' }
JSONTypeTests >> testReadDoubleType [
	self 
		shouldnt: [ JSONSchemaNumber read: 1.2345678 format: #double ]
		raise: JSONTypeError  

]

{ #category : 'tests' }
JSONTypeTests >> testReadDoubleTypeString [
	self 
		shouldnt: [ JSONSchemaNumber readString: '1.2345678' format: #double ]
		raise: JSONTypeError  

]

{ #category : 'tests' }
JSONTypeTests >> testReadDoubleTypeStringWithoutFormat [
	self 
		shouldnt: [ JSONSchemaNumber readString: '1.2345678' ]
		raise: JSONTypeError  

]

{ #category : 'tests' }
JSONTypeTests >> testReadDoubleTypeWithoutFormat [
	self 
		shouldnt: [ JSONSchemaNumber read: 1.2345678 ]
		raise: JSONTypeError  

]

{ #category : 'tests' }
JSONTypeTests >> testReadEnum [
	| schema value |

	schema := { #foo -> (JSONSchema enum: { 'one' . 'two' . 'three' }) } asJSONSchema.
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "two" }' ]
		raise: JSONTypeError.
		
	self assert: (value includesKey: #foo) 

]

{ #category : 'tests' }
JSONTypeTests >> testReadEnumNotIncluded [
	| schema |
	schema := { #foo -> (JSONSchema enum: { 'one' . 'two' . 'three' }) } asJSONSchema.
	self 
		should: [ schema readString: '{ "foo" : "four" }' ]
		raise: JSONConstraintError.
		
]

{ #category : 'tests' }
JSONTypeTests >> testReadIntegerType [
	self 
		shouldnt: [ JSONSchemaInteger read: 123 ]
		raise: JSONTypeError  

]

{ #category : 'tests' }
JSONTypeTests >> testReadIntegerTypeString [
	self 
		shouldnt: [ JSONSchemaInteger readString: '123' ]
		raise: JSONTypeError  

]

{ #category : 'tests' }
JSONTypeTests >> testReadIntegerTypeTooBig [
	"disbaled as integer is not always restricted"
	"self 
		should: [ JSONTypeInteger read: (2 raisedTo: 33) ]
		raise: JSONTypeErrror 
"
]

{ #category : 'tests' }
JSONTypeTests >> testReadIntegerTypeWithString [
	self 
		should: [ JSONSchemaInteger read: '123' ]
		raise: JSONTypeError  

]

{ #category : 'tests' }
JSONTypeTests >> testReadNullType [
	| value |
	self 
		shouldnt: [ value := JSONSchemaNull read: nil ]
		raise: Exception.
	self assert: value equals: nil
]

{ #category : 'tests' }
JSONTypeTests >> testReadNullTypeMismatch [
	self 
		should: [ JSONSchemaNull new read: 123]
		raise: JSONTypeError.

]

{ #category : 'tests' }
JSONTypeTests >> testReadNullTypeString [
	| value |
	self 
		shouldnt: [ value := JSONSchemaNull readString: 'null' ]
		raise: JSONTypeError.
	self assert: value equals: nil 

]

{ #category : 'tests' }
JSONTypeTests >> testReadNumberType [
	self 
		shouldnt: [ JSONSchemaNumber read: 123 ]
		raise: Exception 

]

{ #category : 'tests' }
JSONTypeTests >> testReadNumberTypeString [
	self 
		shouldnt: [ JSONSchemaNumber readString: '123' ]
		raise: JSONTypeError  

]

{ #category : 'tests' }
JSONTypeTests >> testReadNumberTypeWithString [
	self 
		should: [ JSONSchemaNumber read: '123' ]
		raise: JSONTypeError  

]

{ #category : 'tests' }
JSONTypeTests >> testReadObject [
	| schema value |
	"schema := JSONSchemaObject new 
		properties: { 
			#foo -> JSONSchema string } asDictionary."
	schema := { #foo -> #string } asJSONSchema.
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "bar" }' ]
		raise: JSONTypeError.
		
	self assert: (value includesKey: #foo) 

]

{ #category : 'tests' }
JSONTypeTests >> testReadObjectAdditonalPropertiesFalse [
	| schema |
	schema := { 
		#foo -> #string  } asJSONSchema.
	schema additionalProperties: false.
	self 
		should: [ schema readString: '{ "foo" : "one", "bar" : "two" }' ]
		raise: JSONTypeError.
]

{ #category : 'tests' }
JSONTypeTests >> testReadObjectAdditonalPropertiesSchema [
	| schema value |
	schema := { 
		#foo -> #string  } asJSONSchema.
	schema additionalProperties: JSONSchema number.
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "one", "bar" : 3 }' ]
		raise: JSONTypeError.
		
	self assert: (value includesKey: #bar)
]

{ #category : 'tests' }
JSONTypeTests >> testReadObjectAdditonalPropertiesSchemaMixed [
	| schema |
	schema := { 
		#foo -> #string  } asJSONSchema.
	schema additionalProperties: JSONSchema number.
	self 
		should: [ schema readString: '{ "foo" : "one", "bar" : 3 , "bogus" : "15"}' ]
		raise: JSONTypeError.

]

{ #category : 'tests' }
JSONTypeTests >> testReadObjectAdditonalPropertiesTrue [
	| schema value |
	schema := { 
		#foo -> #string  } asJSONSchema.
	schema additionalProperties: true.
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "one", "bar" : "two" }' ]
		raise: JSONTypeError.
		
	self assert: (value includesKey: #bar)
]

{ #category : 'tests' }
JSONTypeTests >> testReadObjectRequiredPropertiesMet [
	| schema value string |
	schema := { 
		#foo -> #string.
		#bar -> #string } asJSONSchema.
	schema required: #(foo bar).
	self 
		shouldnt: [ value := schema readString: '{ "foo" : "one", "bar" : "two" }' ]
		raise: JSONTypeError.
		
	self assert: (value includesKey: #foo).
	self assert: (value includesKey: #bar).
	
	self 
		shouldnt: [ string := schema write: value ]
	 	raise: JSONTypeError.
		
	self assert: (string includesSubstring: 'one').
	self assert: (string includesSubstring: 'two')

]

{ #category : 'tests' }
JSONTypeTests >> testReadObjectRequiredPropertiesNotMet [
	| schema |
	schema := { 
		#foo -> #string.
		#bar -> #string } asJSONSchema.
	schema required: #(foo bar).

	self 
		should: [ schema readString: '{ "bar" : "two" }' ]
		raise: JSONTypeError.
		
	self 
		should: [ schema write: { #bar -> #two } asDictionary ]
		raise: JSONTypeError		
]

{ #category : 'tests' }
JSONTypeTests >> testReadStringTypeString [
	self 
		shouldnt: [ JSONSchemaString readString: '123' ]
		raise: JSONTypeError  

]
