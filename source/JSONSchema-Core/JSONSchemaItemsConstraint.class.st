Class {
	#name : 'JSONSchemaItemsConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'minItems',
		'maxItems'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaItemsConstraint >> definitionProperties [
	^ #( minItems maxItems )
]

{ #category : 'accessing' }
JSONSchemaItemsConstraint >> maxItems [
	^ maxItems
]

{ #category : 'accessing' }
JSONSchemaItemsConstraint >> maxItems: anInteger [
	maxItems := anInteger
]

{ #category : 'accessing' }
JSONSchemaItemsConstraint >> minItems [
	^ minItems
]

{ #category : 'accessing' }
JSONSchemaItemsConstraint >> minItems: anInteger [
	minItems := anInteger
]

{ #category : 'validation' }
JSONSchemaItemsConstraint >> validate [
	^ minItems notNil | maxItems notNil
]

{ #category : 'validation' }
JSONSchemaItemsConstraint >> validate: anArray [ 
	(minItems notNil & maxItems notNil) ifTrue: [ 
		(anArray size between: minItems and: maxItems) 
			ifTrue: [ ^ self ]
			ifFalse: [ JSONConstraintError signal: anArray asString, ' must have between ', minItems asString, ' and ', maxItems asString , ' items' ] ].
	
	minItems notNil ifTrue: [ 
		(anArray size >= minItems) ifFalse: [ 
			 JSONConstraintError signal: anArray asString, ' must have a minimum of ', minItems asString , ' items'  ]  ].
	
	maxItems notNil ifTrue: [ 
		(anArray size <= maxItems) ifFalse: [ 
			 JSONConstraintError signal: anArray asString, ' must have a maximum of ', maxItems asString , ' items'  ]  ]
]

{ #category : 'validation' }
JSONSchemaItemsConstraint >> validateType: anObject [
	^ anObject isArray
]
