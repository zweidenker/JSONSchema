Class {
	#name : 'JSONSchemaIntervalConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'minimum',
		'maximum',
		'minimumExclusive',
		'maximumExclusive'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'as yet unclassified' }
JSONSchemaIntervalConstraint >> definitionProperties [
	^ #( minimum exclusiveMinimum maximum exclusiveMaximum )
]

{ #category : 'accessing' }
JSONSchemaIntervalConstraint >> exclusiveMaximum [
	^ maximumExclusive 
		ifTrue: [ maximum ]
		ifFalse: [ nil ]
]

{ #category : 'accessing' }
JSONSchemaIntervalConstraint >> exclusiveMaximum: aNumber [
	maximum := aNumber.
	maximumExclusive := true
]

{ #category : 'accessing' }
JSONSchemaIntervalConstraint >> exclusiveMinimum [
	^ minimumExclusive 
		ifTrue: [ minimum ]
		ifFalse: [ nil ]
]

{ #category : 'accessing' }
JSONSchemaIntervalConstraint >> exclusiveMinimum: aNumber [
	minimum := aNumber.
	minimumExclusive := true
]

{ #category : 'initialization' }
JSONSchemaIntervalConstraint >> initialize [ 
	super initialize.
	maximumExclusive := false.
	minimumExclusive := false.
]

{ #category : 'accessing' }
JSONSchemaIntervalConstraint >> maximum [
	^ maximumExclusive 
		ifTrue: [ nil ]
		ifFalse: [ maximum ]
]

{ #category : 'accessing' }
JSONSchemaIntervalConstraint >> maximum: anObject [
	maximum := anObject.
	maximumExclusive := false
]

{ #category : 'accessing' }
JSONSchemaIntervalConstraint >> minimum [
	^ minimumExclusive 
		ifTrue: [ nil ]
		ifFalse: [ minimum ]
]

{ #category : 'accessing' }
JSONSchemaIntervalConstraint >> minimum: aNumber [
	minimum := aNumber.
	minimumExclusive := false
]

{ #category : 'validation' }
JSONSchemaIntervalConstraint >> validate [
	^ minimum notNil | maximum notNil
]

{ #category : 'validation' }
JSONSchemaIntervalConstraint >> validate: anInteger [ 
 
	minimum notNil ifTrue: [ 
		minimumExclusive 
			ifTrue: [ 
				(anInteger > minimum) ifFalse: [ 
					JSONConstraintError signal: anInteger asString,' must be greater than ', minimum asString ] ]
			ifFalse: [ 
				(anInteger >= minimum) ifFalse: [ 
					JSONConstraintError signal: anInteger asString,' must be greater than or equal to ', minimum asString ] ]].
		
	maximum notNil ifTrue: [ 
		maximumExclusive 
			ifTrue: [ 
				(anInteger < maximum) ifFalse: [ 
					JSONConstraintError signal: anInteger asString,' must be less than  ', maximum asString ] ]
			ifFalse: [ 
				(anInteger <= maximum) ifFalse: [ 
					JSONConstraintError signal: anInteger asString,' must be less than or equal to ', maximum asString ] ]].

]

{ #category : 'validation' }
JSONSchemaIntervalConstraint >> validateType: anObject [
	^ anObject isNumber
]
