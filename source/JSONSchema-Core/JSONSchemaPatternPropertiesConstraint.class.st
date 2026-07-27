Class {
	#name : 'JSONSchemaPatternPropertiesConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'patternProperties',
		'properties',
		'additionalProperties'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'initialization' }
JSONSchemaPatternPropertiesConstraint >> initializeFromDefinition: aDefinition [
	"patternProperties composes with properties and additionalProperties: a property
	name may be covered by properties and/or by matching patterns; additionalProperties
	applies only to names covered by neither. We keep all three so validate: can decide
	coverage per property."
	patternProperties := aDefinition patternProperties.
	properties := aDefinition properties.
	additionalProperties := aDefinition additionalProperties
]

{ #category : 'validation' }
JSONSchemaPatternPropertiesConstraint >> validate [
	^ patternProperties notNil
]

{ #category : 'validation' }
JSONSchemaPatternPropertiesConstraint >> validate: aDictionary [
	"For each property: validate its value against every patternProperties schema
	whose regex matches the name (unanchored search). A name is 'covered' if it is
	in properties or matched at least one pattern; names covered by neither are
	validated against additionalProperties when that is an actual schema (the default
	is Boolean true = accept all)."
	| resolvedPatterns |
	resolvedPatterns := patternProperties associations collect: [ :assoc |
		{ assoc key asRegex. self resolveVisitor visitSchemaSpec: assoc value } ].
	aDictionary keysAndValuesDo: [ :key :value |
		| matchedPattern |
		matchedPattern := false.
		resolvedPatterns do: [ :pair |
			((pair first) search: key) ifTrue: [
				(pair second) validate: value.
				matchedPattern := true ] ].
		(matchedPattern or: [ properties notNil and: [ properties includesKey: key ] ])
			ifFalse: [
				(additionalProperties isKindOf: JSONSchema)
					ifTrue: [ additionalProperties validate: value ] ] ]
]

{ #category : 'validation' }
JSONSchemaPatternPropertiesConstraint >> validateType: anObject [
	"only constrains objects; anything else passes silently."
	^ anObject isDictionary
]
