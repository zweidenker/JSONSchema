Class {
	#name : 'JSONSchemaNonInterferenceAcrossCombinedSchemasTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-IfThenElse',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'IfThenElse'
}

{ #category : 'testing' }
JSONSchemaNonInterferenceAcrossCombinedSchemasTests >> expectedFailures [
	^ #()
]

{ #category : 'accessing' }
JSONSchemaNonInterferenceAcrossCombinedSchemasTests >> schemaString [
	^ '{"allOf":[{"if":{"exclusiveMaximum":0}},{"then":{"minimum":-10}},{"else":{"multipleOf":2}}]}'
]

{ #category : 'tests' }
JSONSchemaNonInterferenceAcrossCombinedSchemasTests >> testValidButWouldHaveBeenInvalidThroughElse [
	self
		assertValid: '3'
		description: 'valid, but would have been invalid through else'
]

{ #category : 'tests' }
JSONSchemaNonInterferenceAcrossCombinedSchemasTests >> testValidButWouldHaveBeenInvalidThroughThen [
	self
		assertValid: '-100'
		description: 'valid, but would have been invalid through then'
]
