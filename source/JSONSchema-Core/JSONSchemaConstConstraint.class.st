Class {
	#name : 'JSONSchemaConstConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'const',
		'constSpecified'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'initialization' }
JSONSchemaConstConstraint >> initializeFromDefinition: aDefinition [
	"const may be any JSON value including null, so presence is tracked separately
	from the value (the generic definitionProperties path skips nil values)."
	constSpecified := aDefinition constSpecified.
	const := aDefinition const
]

{ #category : 'validation' }
JSONSchemaConstConstraint >> validate [
	^ constSpecified
]

{ #category : 'validation' }
JSONSchemaConstConstraint >> validate: anObject [
	"The instance must be deeply equal to the const value. Smalltalk = already gives
	the JSON semantics needed: 1 ~= true, 0 ~= false, but 20 = 20.0 (numeric), and
	arrays/objects compare structurally and order-independently."
	(const = anObject) ifFalse: [
		JSONConstraintError signal: anObject printString, ' is not equal to the const value ', const printString ]
]

{ #category : 'validation' }
JSONSchemaConstConstraint >> validateType: anObject [
	"const applies to a value of any type."
	^ true
]
