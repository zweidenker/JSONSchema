Class {
	#name : 'JSONSchemaNulCharactersInStringsTests1',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Const',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Const'
}

{ #category : 'accessing' }
JSONSchemaNulCharactersInStringsTests1 >> schemaString [
	^ '{"const":"hello\u0000there"}'
]

{ #category : 'tests' }
JSONSchemaNulCharactersInStringsTests1 >> testDoNotMatchStringLackingNul [
	self
		assertInvalid: '"hellothere"'
		description: 'do not match string lacking nul'
]

{ #category : 'tests' }
JSONSchemaNulCharactersInStringsTests1 >> testMatchStringWithNul [
	self
		assertValid: '"hello\u0000there"'
		description: 'match string with nul'
]
