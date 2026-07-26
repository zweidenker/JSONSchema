Class {
	#name : 'JSONSchemaBaseURIChangeChangeFolderTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-RefRemote',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'RefRemote'
}

{ #category : 'testing' }
JSONSchemaBaseURIChangeChangeFolderTests >> expectedFailures [
	^ #(#testStringIsInvalid #testNumberIsValid)
]

{ #category : 'accessing' }
JSONSchemaBaseURIChangeChangeFolderTests >> schemaString [
	^ '{"definitions":{"baz":{"items":{"$ref":"folderInteger.json"},"$id":"folder/","type":"array"}},"properties":{"list":{"$ref":"#/definitions/baz"}},"$id":"http://localhost:1234/scope_change_defs1.json","type":"object"}'
]

{ #category : 'tests' }
JSONSchemaBaseURIChangeChangeFolderTests >> testNumberIsValid [
	self assertValid: '{"list":[1]}' description: 'number is valid'
]

{ #category : 'tests' }
JSONSchemaBaseURIChangeChangeFolderTests >> testStringIsInvalid [
	self assertInvalid: '{"list":["a"]}' description: 'string is invalid'
]
