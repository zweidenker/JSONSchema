Class {
	#name : 'JSONSchemaPropertyNamesConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'propertyNames'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaPropertyNamesConstraint >> definitionProperties [
	^ #( propertyNames )
]

{ #category : 'accessing' }
JSONSchemaPropertyNamesConstraint >> propertyNames [
	^ propertyNames
]

{ #category : 'accessing' }
JSONSchemaPropertyNamesConstraint >> propertyNames: aDefinition [
	propertyNames := aDefinition
]

{ #category : 'validation' }
JSONSchemaPropertyNamesConstraint >> validate [
	^ propertyNames notNil
]

{ #category : 'validation' }
JSONSchemaPropertyNamesConstraint >> validate: aDictionary [
	"Every property name (a string key) must itself validate against the
	propertyNames sub-schema."
	| resolved |
	resolved := self resolveVisitor visitSchemaSpec: propertyNames.
	aDictionary keysDo: [ :key | resolved validate: key ]
]

{ #category : 'validation' }
JSONSchemaPropertyNamesConstraint >> validateType: anObject [
	"propertyNames only constrains objects; anything else passes silently."
	^ anObject isDictionary
]
