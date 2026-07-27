Class {
	#name : 'JSONSchemaAnyOfConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'anyOf'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaAnyOfConstraint >> anyOf [
	^ anyOf
]

{ #category : 'accessing' }
JSONSchemaAnyOfConstraint >> anyOf: aCollection [
	anyOf := aCollection
]

{ #category : 'accessing' }
JSONSchemaAnyOfConstraint >> definitionProperties [
	^ #( anyOf )
]

{ #category : 'validation' }
JSONSchemaAnyOfConstraint >> validate [
	^ anyOf notNil
]

{ #category : 'validation' }
JSONSchemaAnyOfConstraint >> validate: anObject [
	| visitor matched |
	visitor := self resolveVisitor.
	matched := false.
	anyOf do: [ :definition |
		matched ifFalse: [
			[ (visitor visitSchemaSpec: definition) validate: anObject.
			  matched := true ]
				on: JSONSchemaError do: [ :e | ] ] ].
	matched ifFalse: [
		JSONConstraintError signal: anObject printString, ' matches none of the anyOf schemas' ]
]

{ #category : 'validation' }
JSONSchemaAnyOfConstraint >> validateType: anObject [
	^ true
]
