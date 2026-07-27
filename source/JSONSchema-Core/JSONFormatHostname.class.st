Class {
	#name : 'JSONFormatHostname',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatHostname class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatHostname class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatHostname class >> formatName [
	^ 'hostname'
]

{ #category : 'validation' }
JSONFormatHostname class >> isLDHChar: aChar [
	"Letter, digit or hyphen (the RFC 1034 preferred-name character set)."
	^ (aChar between: $0 and: $9)
		or: [ (aChar between: $a and: $z)
		or: [ (aChar between: $A and: $Z) or: [ aChar = $- ] ] ]
]

{ #category : 'validation' }
JSONFormatHostname class >> isValidString: aString [
	"RFC 1034 preferred name syntax: dot-separated labels, each 1-63 LDH characters,
	not beginning or ending with a hyphen; total length at most 253."
	| labels |
	(aString isEmpty or: [ aString size > 253 ]) ifTrue: [ ^ false ].
	labels := self splitString: aString on: $..
	labels do: [ :label |
		(label size between: 1 and: 63) ifFalse: [ ^ false ].
		(label first = $- or: [ label last = $- ]) ifTrue: [ ^ false ].
		(label allSatisfy: [ :c | self isLDHChar: c ]) ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'validation' }
JSONFormatHostname class >> splitString: aString on: aChar [
	| res start |
	res := OrderedCollection new.
	start := 1.
	1 to: aString size do: [ :i |
		(aString at: i) = aChar ifTrue: [
			res add: (aString copyFrom: start to: i - 1). start := i + 1 ] ].
	res add: (aString copyFrom: start to: aString size).
	^ res
]

{ #category : 'validation' }
JSONFormatHostname class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid hostname' ]
]
