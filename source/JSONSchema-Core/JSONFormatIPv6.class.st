Class {
	#name : 'JSONFormatIPv6',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'validation' }
JSONFormatIPv6 class >> basicConvertString: aString [
	"The value of an ipv6 format is simply the string itself."
	^ aString
]

{ #category : 'validation' }
JSONFormatIPv6 class >> encodeJSON: aString [
	^ aString
]

{ #category : 'validation' }
JSONFormatIPv6 class >> formatName [
	^ 'ipv6'
]

{ #category : 'validation' }
JSONFormatIPv6 class >> isHexGroup: aString [
	^ aString notEmpty
		and: [ aString size <= 4
		and: [ aString allSatisfy: [ :ch | '0123456789abcdefABCDEF' includes: ch ] ] ]
]

{ #category : 'validation' }
JSONFormatIPv6 class >> isIPv4Part: aString [
	"A dotted-decimal IPv4 tail: exactly four decimal octets 0..255."
	| parts |
	parts := self splitString: aString on: $..
	^ parts size = 4
		and: [ parts allSatisfy: [ :p |
			(p notEmpty and: [ p size <= 3 ])
				and: [ (p allSatisfy: [ :ch | ch isDigit ]) and: [ p asInteger <= 255 ] ] ] ]
]

{ #category : 'validation' }
JSONFormatIPv6 class >> isValidString: aString [
	"RFC 4291 IPv6 text form: 8 groups of 1-4 hex digits separated by colons, with an
	optional single :: compressing one or more all-zero groups, and an optional
	dotted-decimal IPv4 tail occupying the last two groups. Rejects whitespace, zone
	ids (%), netmasks (/), triple colons and two :: runs."
	| dc before after firstPart secondPart allTokens slots valid lastIsV4 |
	valid := true.
	aString isEmpty ifTrue: [ ^ false ].
	(aString anySatisfy: [ :ch | ch isSeparator ]) ifTrue: [ ^ false ].
	((aString includes: $/) or: [ aString includes: $% ]) ifTrue: [ ^ false ].
	dc := aString indexOfSubCollection: '::'.
	dc = 0
		ifTrue: [ firstPart := self splitString: aString on: $:. secondPart := nil ]
		ifFalse: [
			(aString indexOfSubCollection: '::' startingAt: dc + 2) = 0 ifFalse: [ ^ false ].
			before := aString copyFrom: 1 to: dc - 1.
			after := aString copyFrom: dc + 2 to: aString size.
			(before notEmpty and: [ before last = $: ]) ifTrue: [ ^ false ].
			(after notEmpty and: [ after first = $: ]) ifTrue: [ ^ false ].
			firstPart := before isEmpty ifTrue: [ #() ] ifFalse: [ self splitString: before on: $: ].
			secondPart := after isEmpty ifTrue: [ #() ] ifFalse: [ self splitString: after on: $: ] ].
	allTokens := dc = 0
		ifTrue: [ firstPart ]
		ifFalse: [ (OrderedCollection withAll: firstPart) addAll: secondPart; yourself ].
	allTokens doWithIndex: [ :tok :i |
		(i < allTokens size and: [ tok includes: $. ]) ifTrue: [ valid := false ] ].
	slots := 0.
	allTokens isEmpty ifFalse: [
		lastIsV4 := allTokens last includes: $..
		allTokens allButLast do: [ :tok |
			(self isHexGroup: tok) ifFalse: [ valid := false ]. slots := slots + 1 ].
		lastIsV4
			ifTrue: [ (self isIPv4Part: allTokens last) ifFalse: [ valid := false ]. slots := slots + 2 ]
			ifFalse: [ (self isHexGroup: allTokens last) ifFalse: [ valid := false ]. slots := slots + 1 ] ].
	dc = 0
		ifTrue: [ slots = 8 ifFalse: [ valid := false ] ]
		ifFalse: [ slots >= 8 ifTrue: [ valid := false ] ].
	^ valid
]

{ #category : 'validation' }
JSONFormatIPv6 class >> splitString: aString on: aChar [
	"Split keeping empty tokens (unlike substrings:), so stray/leading/trailing
	colons surface as empty groups that then fail validation."
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
JSONFormatIPv6 class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid ipv6 address' ]
]
