Class {
	#name : 'JSONSchemaRelativePointerRefToObjectTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaRelativePointerRefToObjectTests >> expectedFailures [
	^ #(#testMismatch #testMatch)
]

{ #category : 'accessing' }
JSONSchemaRelativePointerRefToObjectTests >> schemaString [
	^ '{"properties":{"foo":{"type":"integer"},"bar":{"$ref":"#/properties/foo"}}}'
]

{ #category : 'tests' }
JSONSchemaRelativePointerRefToObjectTests >> testMatch [
	self assertValid: '{"bar":3}' description: 'match'
]

{ #category : 'tests' }
JSONSchemaRelativePointerRefToObjectTests >> testMismatch [
	self assertInvalid: '{"bar":true}' description: 'mismatch'
]
