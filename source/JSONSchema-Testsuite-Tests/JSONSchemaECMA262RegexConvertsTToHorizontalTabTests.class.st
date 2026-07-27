Class {
	#name : 'JSONSchemaECMA262RegexConvertsTToHorizontalTabTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-EcmascriptRegex',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'EcmascriptRegex'
}

{ #category : 'testing' }
JSONSchemaECMA262RegexConvertsTToHorizontalTabTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaECMA262RegexConvertsTToHorizontalTabTests >> schemaString [
	^ '{"pattern":"^\\t$","type":"string"}'
]

{ #category : 'tests' }
JSONSchemaECMA262RegexConvertsTToHorizontalTabTests >> testDoesNotMatch [
	self assertInvalid: '"\\t"' description: 'does not match'
]

{ #category : 'tests' }
JSONSchemaECMA262RegexConvertsTToHorizontalTabTests >> testMatches [
	self assertValid: '"\t"' description: 'matches'
]
