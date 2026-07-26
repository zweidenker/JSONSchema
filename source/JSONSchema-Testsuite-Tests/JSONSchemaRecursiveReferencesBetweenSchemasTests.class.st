Class {
	#name : 'JSONSchemaRecursiveReferencesBetweenSchemasTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Ref',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Ref'
}

{ #category : 'testing' }
JSONSchemaRecursiveReferencesBetweenSchemasTests >> expectedFailures [
	^ #(#testInvalidTree #testValidTree)
]

{ #category : 'accessing' }
JSONSchemaRecursiveReferencesBetweenSchemasTests >> schemaString [
	^ '{"description":"tree of nodes","required":["meta","nodes"],"definitions":{"node":{"description":"node","required":["value"],"$id":"http://localhost:1234/node","type":"object","properties":{"value":{"type":"number"},"subtree":{"$ref":"tree"}}}},"$id":"http://localhost:1234/tree","type":"object","properties":{"nodes":{"items":{"$ref":"node"},"type":"array"},"meta":{"type":"string"}}}'
]

{ #category : 'tests' }
JSONSchemaRecursiveReferencesBetweenSchemasTests >> testInvalidTree [
	self
		assertInvalid:
			'{"nodes":[{"value":1,"subtree":{"nodes":[{"value":"string is invalid"},{"value":1.2}],"meta":"child"}},{"value":2,"subtree":{"nodes":[{"value":2.1},{"value":2.2}],"meta":"child"}}],"meta":"root"}'
		description: 'invalid tree'
]

{ #category : 'tests' }
JSONSchemaRecursiveReferencesBetweenSchemasTests >> testValidTree [
	self
		assertValid:
			'{"nodes":[{"value":1,"subtree":{"nodes":[{"value":1.1},{"value":1.2}],"meta":"child"}},{"value":2,"subtree":{"nodes":[{"value":2.1},{"value":2.2}],"meta":"child"}}],"meta":"root"}'
		description: 'valid tree'
]
