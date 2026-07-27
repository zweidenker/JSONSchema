Class {
	#name : 'JSONSchemaDependenciesConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'dependencies'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaDependenciesConstraint >> definitionProperties [
	^ #( dependencies )
]

{ #category : 'accessing' }
JSONSchemaDependenciesConstraint >> dependencies [
	^ dependencies
]

{ #category : 'accessing' }
JSONSchemaDependenciesConstraint >> dependencies: aDictionary [
	dependencies := aDictionary
]

{ #category : 'validation' }
JSONSchemaDependenciesConstraint >> validate [
	^ dependencies notNil
]

{ #category : 'validation' }
JSONSchemaDependenciesConstraint >> validate: aDictionary [
	"For each present property that carries a dependency: an array-valued dependency
	requires each named property to be present too (property dependency); a
	schema-valued dependency requires the whole object to satisfy that schema
	(schema dependency, possibly a bare true/false)."
	dependencies keysAndValuesDo: [ :key :dependency |
		(aDictionary includesKey: key) ifTrue: [
			dependency isArray
				ifTrue: [
					dependency do: [ :requiredKey |
						(aDictionary includesKey: requiredKey) ifFalse: [
							JSONConstraintError signal: aDictionary printString, ' is missing property ''', requiredKey, ''' required by dependency on ''', key, '''' ] ] ]
				ifFalse: [
					(self resolveVisitor visitSchemaSpec: dependency) validate: aDictionary ] ] ]
]

{ #category : 'validation' }
JSONSchemaDependenciesConstraint >> validateType: anObject [
	"dependencies only constrains object-shaped instances; anything else passes silently."
	^ anObject isDictionary
]
