Class {
	#name : 'JSONSchemaMultipleOfConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'number'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'instance creation' }
JSONSchemaMultipleOfConstraint class >> number: aNumber [
	^ self new 	
		multipleOf: aNumber
]

{ #category : 'accessing' }
JSONSchemaMultipleOfConstraint >> definitionProperties [
	^ #( multipleOf )
]

{ #category : 'accessing' }
JSONSchemaMultipleOfConstraint >> multipleOf [
	^ number 
]

{ #category : 'accessing' }
JSONSchemaMultipleOfConstraint >> multipleOf: aNumber [
	number := aNumber
]

{ #category : 'validation' }
JSONSchemaMultipleOfConstraint >> validate [
	^ number notNil
]

{ #category : 'validation' }
JSONSchemaMultipleOfConstraint >> validate: anObject [
	| factor |
	factor := anObject / number.
	(factor = factor asInteger) ifFalse: [ 
		JSONConstraintError signal: anObject asString, ' is not a multiple of ', number asString ] 
]

{ #category : 'validation' }
JSONSchemaMultipleOfConstraint >> validateType: anObject [
	^ anObject isNumber
]
