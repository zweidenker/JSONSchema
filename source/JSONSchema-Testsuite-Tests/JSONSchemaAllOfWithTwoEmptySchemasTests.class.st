Class {
	#name : 'JSONSchemaAllOfWithTwoEmptySchemasTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-AllOf',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'AllOf'
}

{ #category : 'testing' }
JSONSchemaAllOfWithTwoEmptySchemasTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaAllOfWithTwoEmptySchemasTests >> schemaString [
	^ '{"allOf":[{},{}]}'
]

{ #category : 'tests' }
JSONSchemaAllOfWithTwoEmptySchemasTests >> testAnyDataIsValid [
	self assertValid: '1' description: 'any data is valid'
]
