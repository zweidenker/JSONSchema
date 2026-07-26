Class {
	#name : 'JSONSchemaBooleanFalse',
	#superclass : 'JSONSchema',
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaBooleanFalse class >> typeName [
	^ 'boolean-false'
]

{ #category : 'visiting' }
JSONSchemaBooleanFalse >> acceptJSONSchema: aVisitor [
	"a leaf value with no nested schemas to resolve - nothing to visit"
	^ self
]

{ #category : 'validation' }
JSONSchemaBooleanFalse >> validate: anObject [
	JSONTypeError signal: 'schema is boolean false, no value is valid'
]

{ #category : 'validation' }
JSONSchemaBooleanFalse >> validateType: anObject [
	JSONTypeError signal: 'schema is boolean false, no value is valid'
]
