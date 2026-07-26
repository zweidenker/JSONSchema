Class {
	#name : 'JSONSchemaUniquenessConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'uniqueItems'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaUniquenessConstraint >> definitionProperties [
	^ #( uniqueItems )
]

{ #category : 'accessing' }
JSONSchemaUniquenessConstraint >> uniqueItems [
	^ uniqueItems
]

{ #category : 'accessing' }
JSONSchemaUniquenessConstraint >> uniqueItems: aBoolean [
	uniqueItems := aBoolean
]

{ #category : 'validation' }
JSONSchemaUniquenessConstraint >> validate [
	^ uniqueItems notNil
]

{ #category : 'validation' }
JSONSchemaUniquenessConstraint >> validate: anArray [
	(uniqueItems notNil and: [ uniqueItems ])
		ifTrue: [ anArray size = anArray asSet size
				ifFalse: [ JSONConstraintError
						signal: anArray , ' must not contain doublet elements' ] ]
]

{ #category : 'validation' }
JSONSchemaUniquenessConstraint >> validateType: anObject [
	^ true
]
