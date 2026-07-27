Class {
	#name : 'JSONSchemaRequiredConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'required'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaRequiredConstraint >> required [
	^ required
]

{ #category : 'accessing' }
JSONSchemaRequiredConstraint >> required: aCollection [
	required := aCollection
]

{ #category : 'accessing' }
JSONSchemaRequiredConstraint >> definitionProperties [
	^ #( required )
]

{ #category : 'validation' }
JSONSchemaRequiredConstraint >> validate [
	^ required notNil
]

{ #category : 'validation' }
JSONSchemaRequiredConstraint >> validate: aDictionary [
	required do: [ :key |
		(aDictionary includesKey: key) ifFalse: [
			JSONSchemaMissingRequiredProperty new property: key; signal ] ]
]

{ #category : 'validation' }
JSONSchemaRequiredConstraint >> validateType: anObject [
	"required only applies to object-shaped instances - a schema like {""required"":[...]}
	with no explicit type:object must silently accept non-object values, per spec."
	^ anObject isDictionary
]
