Class {
	#name : 'JSONSchemaPatternConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'pattern'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaPatternConstraint >> definitionProperties [
	^ #( pattern )
]

{ #category : 'accessing' }
JSONSchemaPatternConstraint >> pattern [
	^ pattern
]

{ #category : 'accessing' }
JSONSchemaPatternConstraint >> pattern: aString [
	pattern := aString
]

{ #category : 'validation' }
JSONSchemaPatternConstraint >> validate [
	^ pattern notNil
]

{ #category : 'validation' }
JSONSchemaPatternConstraint >> validate: aString [
	(pattern asRegex search: aString) ifFalse: [
		JSONConstraintError signal: aString, ' does not match pattern ', pattern ]
]

{ #category : 'validation' }
JSONSchemaPatternConstraint >> validateType: anObject [
	^ anObject isString
]
