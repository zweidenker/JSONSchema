Class {
	#name : 'JSONSchemaTestsuiteTestCase',
	#superclass : 'TestCase',
	#instVars : [
		'schema'
	],
	#category : 'JSONSchema-Testsuite-Core-TestCase',
	#package : 'JSONSchema-Testsuite-Core',
	#tag : 'TestCase'
}

{ #category : 'actions' }
JSONSchemaTestsuiteTestCase class >> generateExpectedFailures [
	self allSubclasses
		do: [ :class | 
			| result expectedFailures methodName |
			result := class suite run.
			expectedFailures := result failures , result errors
				collect: #selector.
			methodName := class
				compile:
					'expectedFailures
        ^ ' , expectedFailures asArray printString.
			(class >> methodName)
				protocol: 'testing';
				reformat ]
]

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
