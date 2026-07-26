Class {
	#name : 'JSONSchemaEnumWith0DoesNotMatchFalseTests',
	#superclass : 'JSONSchemaTestsuiteTestCase',
	#category : 'JSONSchema-Testsuite-Tests-Enum',
	#package : 'JSONSchema-Testsuite-Tests',
	#tag : 'Enum'
}

{ #category : 'testing' }
JSONSchemaEnumWith0DoesNotMatchFalseTests >> expectedFailures [
	^ #(  )
]

{ #category : 'accessing' }
JSONSchemaEnumWith0DoesNotMatchFalseTests >> schemaString [
	^ '{"enum":[0]}'
]

{ #category : 'tests' }
JSONSchemaEnumWith0DoesNotMatchFalseTests >> testFalseIsInvalid [
	self assertInvalid: 'false' description: 'false is invalid'
]

{ #category : 'tests' }
JSONSchemaEnumWith0DoesNotMatchFalseTests >> testFloatZeroIsValid [
	self assertValid: '0.0' description: 'float zero is valid'
]

{ #category : 'tests' }
JSONSchemaEnumWith0DoesNotMatchFalseTests >> testIntegerZeroIsValid [
	self assertValid: '0' description: 'integer zero is valid'
]
