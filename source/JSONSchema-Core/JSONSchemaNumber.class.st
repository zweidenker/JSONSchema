Class {
	#name : 'JSONSchemaNumber',
	#superclass : 'JSONPrimitiveSchema',
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaNumber class >> typeName [
	^ 'number'
]

{ #category : 'accessing' }
JSONSchemaNumber >> defaultFormat [
	^ JSONNumberFormat
]

{ #category : 'accessing' }
JSONSchemaNumber >> interval [ 
	| constraint |
	constraint := JSONSchemaIntervalConstraint new.
	self addConstraint: constraint.
	^ constraint
]

{ #category : 'accessing' }
JSONSchemaNumber >> multipleOf: aNumber [
	self addConstraint: (JSONSchemaMultipleOfConstraint number: aNumber )
]

{ #category : 'validation' }
JSONSchemaNumber >> validateType: anObject [
	(anObject isKindOf: Number) ifFalse: [ 
		JSONTypeError signal: anObject asString, ' is not a number ' ]
	
]
