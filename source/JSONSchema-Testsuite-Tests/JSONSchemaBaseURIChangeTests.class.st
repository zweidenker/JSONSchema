Class {
	#name : 'JSONSchemaBaseURIChangeTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-RefRemote',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'RefRemote'
}

{ #category : 'testing' }
JSONSchemaBaseURIChangeTests >> expectedFailures [
	^ #(#testBaseURIChangeRefInvalid #testBaseURIChangeRefValid)
]

{ #category : 'accessing' }
JSONSchemaBaseURIChangeTests >> schemaString [
	^ '{"items":{"items":{"$ref":"folderInteger.json"},"$id":"folder/"},"$id":"http://localhost:1234/"}'
]

{ #category : 'tests' }
JSONSchemaBaseURIChangeTests >> testBaseURIChangeRefInvalid [
	self
		assertInvalid: '[["a"]]'
		description: 'base URI change ref invalid'
]

{ #category : 'tests' }
JSONSchemaBaseURIChangeTests >> testBaseURIChangeRefValid [
	self assertValid: '[[1]]' description: 'base URI change ref valid'
]
