Class {
	#name : 'JSONSchemaString',
	#superclass : 'JSONPrimitiveSchema',
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'as yet unclassified' }
JSONSchemaString class >> typeName [
	^ 'string'
]

{ #category : 'initialization' }
JSONSchemaString >> defaultFormat [
	^ JSONStringFormat 
]

{ #category : 'accessing' }
JSONSchemaString >> enum: aCollection [
	self addConstraint: ( JSONSchemaEnumConstraint options: aCollection )
]

{ #category : 'reading' }
JSONSchemaString >> readUsing: aReader [ 
	| value |
	value := aReader parseValue.
	value ifNil: [ 
		nullable 
			ifTrue: [ ^ nil ]
			ifFalse: [ JSONTypeError signal: self class typeName, ' cannot be nil' ] ].
	^ self readString: value
]

{ #category : 'validating' }
JSONSchemaString >> validateType: aString [ 
	aString isString ifFalse: [ 
		JSONTypeError signal: aString asString, ' is not a string ' ]
]

{ #category : 'writing' }
JSONSchemaString >> write: anObject on: writer [
	anObject ifNil: [ 
		nullable ifTrue: [ 
			^ writer writeNull ] ].
	^ writer writeString: (self write: anObject)
]
