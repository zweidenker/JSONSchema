Class {
	#name : 'JSONSchemaNotConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'not'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaNotConstraint >> not [
	^ not
]

{ #category : 'accessing' }
JSONSchemaNotConstraint >> not: aDefinition [
	not := aDefinition
]

{ #category : 'accessing' }
JSONSchemaNotConstraint >> definitionProperties [
	^ #( not )
]

{ #category : 'validation' }
JSONSchemaNotConstraint >> validate [
	^ not notNil
]

{ #category : 'validation' }
JSONSchemaNotConstraint >> validate: anObject [
	| visitor matches |
	visitor := JSONSchemaReferenceResolveVisitor new.
	matches := true.
	[ (visitor visitSchemaSpec: not) validate: anObject ]
		on: JSONSchemaError do: [ :e | matches := false ].
	matches ifTrue: [
		JSONConstraintError signal: anObject printString, ' matches the not-schema, expected it not to' ]
]

{ #category : 'validation' }
JSONSchemaNotConstraint >> validateType: anObject [
	^ true
]
