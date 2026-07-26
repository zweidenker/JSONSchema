Class {
	#name : 'JSONSchemaTestsuiteTestCase',
	#superclass : 'TestCase',
	#instVars : [
		'schema'
	],
	#category : 'JSONSchema-Testsuite-Builder',
	#package : 'JSONSchema-Testsuite',
	#tag : 'Builder'
}

{ #category : 'asserting' }
JSONSchemaTestsuiteTestCase >> assertInvalid: json description: description [
	| object |
	object := NeoJSONReader fromString: json.
	self
		should: [ schema validate: object ]
		raise: JSONSchemaError
		description: description
]

{ #category : 'asserting' }
JSONSchemaTestsuiteTestCase >> assertValid: json description: description [
	| object |
	object := NeoJSONReader fromString: json.
	self
		shouldnt: [ schema validate: object ]
		raise: JSONSchemaError
		description: description
]

{ #category : 'asserting' }
JSONSchemaTestsuiteTestCase >> schemaString [
	self subclassResponsibility
]

{ #category : 'running' }
JSONSchemaTestsuiteTestCase >> setUp [
	super setUp.
	schema := JSONSchema fromString: self schemaString
]
