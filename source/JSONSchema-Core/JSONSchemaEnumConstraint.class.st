Class {
	#name : 'JSONSchemaEnumConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'options'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaEnumConstraint class >> options: aCollection [
	^ self new
		options: aCollection
]

{ #category : 'accessing' }
JSONSchemaEnumConstraint >> definitionProperties [
	^ #( enum )
]

{ #category : 'accessing' }
JSONSchemaEnumConstraint >> enum [
	^ options
]

{ #category : 'accessing' }
JSONSchemaEnumConstraint >> enum: aCollection [
	options := aCollection
]

{ #category : 'accessing' }
JSONSchemaEnumConstraint >> options: aCollection [ 
	options := aCollection
]

{ #category : 'valiadtion' }
JSONSchemaEnumConstraint >> validate [
	^ options notNil
]

{ #category : 'validation' }
JSONSchemaEnumConstraint >> validate: aString [
	(options includes: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid option: valid are: ', ($, join: options) ]
]

{ #category : 'validation' }
JSONSchemaEnumConstraint >> validateType: anObject [
	^ true
]
