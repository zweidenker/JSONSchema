Class {
	#name : 'JSONSchemaRelativePointerRefToArrayTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaRelativePointerRefToArrayTests >> expectedFailures [
	^ #(#testMatchArray #testMismatchArray)
]

{ #category : 'accessing' }
JSONSchemaRelativePointerRefToArrayTests >> schemaString [
	^ '{"items":[{"type":"integer"},{"$ref":"#/items/0"}]}'
]

{ #category : 'tests' }
JSONSchemaRelativePointerRefToArrayTests >> testMatchArray [
	self assertValid: '[1,2]' description: 'match array'
]

{ #category : 'tests' }
JSONSchemaRelativePointerRefToArrayTests >> testMismatchArray [
	self assertInvalid: '[1,"foo"]' description: 'mismatch array'
]
