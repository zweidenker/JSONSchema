Class {
	#name : 'JSONSchemaRefOverridesAnySiblingKeywordsTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaRefOverridesAnySiblingKeywordsTests >> expectedFailures [
	^ #(#testRefInvalid)
]

{ #category : 'accessing' }
JSONSchemaRefOverridesAnySiblingKeywordsTests >> schemaString [
	^ '{"definitions":{"reffed":{"type":"array"}},"properties":{"foo":{"$ref":"#/definitions/reffed","maxItems":2}}}'
]

{ #category : 'tests' }
JSONSchemaRefOverridesAnySiblingKeywordsTests >> testRefInvalid [
	self assertInvalid: '{"foo":"string"}' description: 'ref invalid'
]

{ #category : 'tests' }
JSONSchemaRefOverridesAnySiblingKeywordsTests >> testRefValid [
	self assertValid: '{"foo":[]}' description: 'ref valid'
]

{ #category : 'tests' }
JSONSchemaRefOverridesAnySiblingKeywordsTests >> testRefValidMaxItemsIgnored [
	self
		assertValid: '{"foo":[1,2,3]}'
		description: 'ref valid, maxItems ignored'
]
