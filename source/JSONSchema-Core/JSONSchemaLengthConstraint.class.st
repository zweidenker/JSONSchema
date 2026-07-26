Class {
	#name : 'JSONSchemaLengthConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'minLength',
		'maxLength'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaLengthConstraint >> definitionProperties [
	^ #( minLength maxLength )
]

{ #category : 'accessing' }
JSONSchemaLengthConstraint >> maxLength [
	^ maxLength
]

{ #category : 'accessing' }
JSONSchemaLengthConstraint >> maxLength: anInteger [ 
	maxLength := anInteger
]

{ #category : 'accessing' }
JSONSchemaLengthConstraint >> minLength [
	^ minLength
]

{ #category : 'accessing' }
JSONSchemaLengthConstraint >> minLength: anInteger [ 
	minLength := anInteger
]

{ #category : 'validation' }
JSONSchemaLengthConstraint >> validate [
	^ minLength notNil | maxLength notNil
]

{ #category : 'validation' }
JSONSchemaLengthConstraint >> validate: aString [ 
	(minLength notNil & maxLength notNil) ifTrue: [ 
		(aString size between: minLength and: maxLength) 
			ifTrue: [ ^ self ]
			ifFalse: [ JSONConstraintError signal: aString, ' must have length between ', minLength asString, ' and ', maxLength asString ] ].
	
	minLength notNil ifTrue: [ 
		(aString size >= minLength) ifFalse: [ 
			 JSONConstraintError signal: aString, ' must have a minimum length of ', minLength asString ]  ].
	
	maxLength notNil ifTrue: [ 
		(aString size <= maxLength) ifFalse: [ 
			 JSONConstraintError signal: aString, ' must have a maximum length of ', maxLength asString ]  ]
]

{ #category : 'validation' }
JSONSchemaLengthConstraint >> validateType: anObject [
	^ anObject isString
]
