Class {
	#name : 'JSONSchemaSizeConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'minProperties',
		'maxProperties'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaSizeConstraint >> definitionProperties [
	^ #( minProperties maxProperties )
]

{ #category : 'accessing' }
JSONSchemaSizeConstraint >> maxProperties [
	^ maxProperties
]

{ #category : 'accessing' }
JSONSchemaSizeConstraint >> maxProperties: anInteger [
	maxProperties := anInteger
]

{ #category : 'accessing' }
JSONSchemaSizeConstraint >> minProperties [
	^ minProperties
]

{ #category : 'accessing' }
JSONSchemaSizeConstraint >> minProperties: anIntger [
	minProperties := anIntger
]

{ #category : 'validation' }
JSONSchemaSizeConstraint >> validate [
	^ minProperties notNil | maxProperties notNil
]

{ #category : 'validation' }
JSONSchemaSizeConstraint >> validate: aDictionary [ 
	(minProperties notNil & maxProperties notNil) ifTrue: [ 
		(aDictionary size between: minProperties and: maxProperties) 
			ifTrue: [ ^ self ]
			ifFalse: [ JSONConstraintError signal: aDictionary asString, ' must have size between ', minProperties asString, ' and ', maxProperties asString ] ].
	
	minProperties notNil ifTrue: [ 
		(aDictionary size >= minProperties) ifFalse: [ 
			 JSONConstraintError signal: aDictionary asString, ' must have a minimum size of ', minProperties asString ]  ].
	
	maxProperties notNil ifTrue: [ 
		(aDictionary size <= maxProperties) ifFalse: [ 
			 JSONConstraintError signal: aDictionary asString, ' must have a maximum size of ', maxProperties asString ]  ]
]

{ #category : 'validation' }
JSONSchemaSizeConstraint >> validateType: anObject [
	^ anObject isDictionary
]
