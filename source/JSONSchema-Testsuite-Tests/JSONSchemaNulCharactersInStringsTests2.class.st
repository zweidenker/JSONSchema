Class {
	#name : 'JSONSchemaNulCharactersInStringsTests2',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaNulCharactersInStringsTests2 >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaNulCharactersInStringsTests2 >> schemaString [
	^ '{"enum":["hello\u0000there"]}'
]

{ #category : 'tests' }
JSONSchemaNulCharactersInStringsTests2 >> testDoNotMatchStringLackingNul [
	self
		assertInvalid: '"hellothere"'
		description: 'do not match string lacking nul'
]

{ #category : 'tests' }
JSONSchemaNulCharactersInStringsTests2 >> testMatchStringWithNul [
	self
		assertValid: '"hello\u0000there"'
		description: 'match string with nul'
]
