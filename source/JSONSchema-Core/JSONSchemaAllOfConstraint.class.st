Class {
	#name : 'JSONSchemaAllOfConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'allOf'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaAllOfConstraint >> allOf [
	^ allOf
]

{ #category : 'accessing' }
JSONSchemaAllOfConstraint >> allOf: aCollection [
	allOf := aCollection
]

{ #category : 'accessing' }
JSONSchemaAllOfConstraint >> definitionProperties [
	^ #( allOf )
]

{ #category : 'validation' }
JSONSchemaAllOfConstraint >> validate [
	^ allOf notNil
]

{ #category : 'validation' }
JSONSchemaAllOfConstraint >> validate: anObject [
	| visitor |
	visitor := JSONSchemaReferenceResolveVisitor new.
	allOf do: [ :definition | (visitor visitSchemaSpec: definition) validate: anObject ]
]

{ #category : 'validation' }
JSONSchemaAllOfConstraint >> validateType: anObject [
	^ true
]
