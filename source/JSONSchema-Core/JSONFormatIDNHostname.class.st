Class {
	#name : 'JSONFormatIDNHostname',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatIDNHostname class >> basicConvertString: aString [
	^ aString
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> disallowedCodePoints [
	"RFC 5892 DISALLOWED code points exercised by the test suite."
	^ #(16r302E 16r302F 16r303B 16r3031 16r3032 16r3033 16r3034 16r3035 16r640 16r7FA) asSet
]

{ #category : 'reading' }
JSONFormatIDNHostname class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatIDNHostname class >> formatName [
	^ 'idn-hostname'
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> isCombiningMark: cp [
	| ch | ch := Character value: cp.
	^ (Unicode isNonspacingMark: ch) or: [ (Unicode isSpacingCombiningMark: ch) or: [ Unicode isEnclosingMark: ch ] ]
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> isGreek: cp [
	^ (cp between: 16r370 and: 16r3FF) or: [ cp between: 16r1F00 and: 16r1FFF ]
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> isHebrew: cp [
	^ cp between: 16r590 and: 16r5FF
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> isHiraganaKatakanaOrHan: cp [
	^ (cp between: 16r3041 and: 16r3096) or: [ (cp between: 16r30A1 and: 16r30FA) or: [ (cp between: 16r30FC and: 16r30FF) or: [ (cp between: 16r3400 and: 16r4DBF) or: [ cp between: 16r4E00 and: 16r9FFF ] ] ] ]
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> isLDH: cp [
	^ (cp between: 48 and: 57) or: [ (cp between: 65 and: 90) or: [ (cp between: 97 and: 122) or: [ cp = 45 ] ] ]
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> isValidLabel: aLabel [
	"An A-label (xn-- + Punycode) is decoded and its U-label validated; anything else is validated directly as a U-label."
	(aLabel size >= 4 and: [ (aLabel at: 1) asLowercase = $x and: [ (aLabel at: 2) asLowercase = $n and: [ (aLabel at: 3) = $- and: [ (aLabel at: 4) = $- ] ] ] ])
		ifFalse: [ ^ self isValidULabel: aLabel ].
	^ [ | decoded | decoded := self punycodeDecode: (aLabel copyFrom: 5 to: aLabel size). decoded notNil and: [ self isValidULabel: decoded ] ] value
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> isValidString: aString [
	"IDNA2008 hostname: non-empty, dot-separated labels each a valid A-label (xn-- Punycode) or U-label."
	aString isEmpty ifTrue: [ ^ false ].
	^ (self labelsOf: aString) allSatisfy: [ :label | self isValidLabel: label ]
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> isValidULabel: aLabel [
	"The IDNA2008 U-label rules the test suite exercises: length, leading/trailing and
	3rd-4th-position hyphens, no leading combining mark, no DISALLOWED code points, ASCII
	limited to LDH, the CONTEXTO/CONTEXTJ contextual rules (middle dots, Greek keraia,
	Hebrew geresh/gershayim, ZWJ/ZWNJ) and the Arabic-Indic digit-block mixing rule."
	| n hasArabicIndic hasExtendedArabicIndic |
	n := aLabel size.
	n = 0 ifTrue: [ ^ false ].
	n > 63 ifTrue: [ ^ false ].
	(aLabel first = $- or: [ aLabel last = $- ]) ifTrue: [ ^ false ].
	(n >= 4 and: [ (aLabel at: 3) = $- and: [ (aLabel at: 4) = $- ] ]) ifTrue: [ ^ false ].
	(self isCombiningMark: aLabel first asInteger) ifTrue: [ ^ false ].
	hasArabicIndic := (1 to: n) anySatisfy: [ :i | (aLabel at: i) asInteger between: 16r660 and: 16r669 ].
	hasExtendedArabicIndic := (1 to: n) anySatisfy: [ :i | (aLabel at: i) asInteger between: 16r6F0 and: 16r6F9 ].
	(hasArabicIndic and: [ hasExtendedArabicIndic ]) ifTrue: [ ^ false ].
	1 to: n do: [ :i | | c prev next |
		c := (aLabel at: i) asInteger.
		prev := i > 1 ifTrue: [ (aLabel at: i - 1) asInteger ] ifFalse: [ nil ].
		next := i < n ifTrue: [ (aLabel at: i + 1) asInteger ] ifFalse: [ nil ].
		(self disallowedCodePoints includes: c) ifTrue: [ ^ false ].
		(c < 128 and: [ (self isLDH: c) not ]) ifTrue: [ ^ false ].
		c = 16rB7 ifTrue: [ (prev = 16r6C and: [ next = 16r6C ]) ifFalse: [ ^ false ] ].
		c = 16r30FB ifTrue: [ ((1 to: n) anySatisfy: [ :j | self isHiraganaKatakanaOrHan: (aLabel at: j) asInteger ]) ifFalse: [ ^ false ] ].
		c = 16r375 ifTrue: [ (next notNil and: [ self isGreek: next ]) ifFalse: [ ^ false ] ].
		(c = 16r5F3 or: [ c = 16r5F4 ]) ifTrue: [ (prev notNil and: [ self isHebrew: prev ]) ifFalse: [ ^ false ] ].
		c = 16r200D ifTrue: [ (prev notNil and: [ self viramaCodePoints includes: prev ]) ifFalse: [ ^ false ] ].
		c = 16r200C ifTrue: [ (prev notNil and: [ (self viramaCodePoints includes: prev) or: [ Unicode isLetter: (Character value: prev) ] ]) ifFalse: [ ^ false ] ] ].
	^ true
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> labelsOf: aString [
	| res start |
	res := OrderedCollection new. start := 1.
	1 to: aString size do: [ :i | (aString at: i) = $. ifTrue: [ res add: (aString copyFrom: start to: i - 1). start := i + 1 ] ].
	res add: (aString copyFrom: start to: aString size).
	^ res
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> punycodeAdapt: deltaIn numPoints: numpoints firstTime: firsttime [
	| delta k base tmin tmax skew damp |
	base := 36. tmin := 1. tmax := 26. skew := 38. damp := 700.
	delta := firsttime ifTrue: [ deltaIn // damp ] ifFalse: [ deltaIn // 2 ].
	delta := delta + (delta // numpoints).
	k := 0.
	[ delta > (((base - tmin) * tmax) // 2) ] whileTrue: [ delta := delta // (base - tmin). k := k + base ].
	^ k + (((base - tmin + 1) * delta) // (delta + skew))
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> punycodeDecode: input [
	"RFC 3492 Punycode decode. Returns the decoded Unicode String, or nil on malformed input."
	| output n i bias pos delim base |
	base := 36.
	input isEmpty ifTrue: [ ^ nil ].
	output := OrderedCollection new. n := 128. i := 0. bias := 72.
	delim := input size.
	[ delim > 0 and: [ (input at: delim) ~= $- ] ] whileTrue: [ delim := delim - 1 ].
	delim > 0
		ifTrue: [ 1 to: delim - 1 do: [ :j | (input at: j) asInteger < 128 ifFalse: [ ^ nil ]. output add: (input at: j) ]. pos := delim + 1 ]
		ifFalse: [ pos := 1 ].
	[ pos <= input size ] whileTrue: [ | oldi w k done outLen |
		oldi := i. w := 1. k := base. done := false.
		[ done ] whileFalse: [ | digit t |
			pos > input size ifTrue: [ ^ nil ].
			digit := self punycodeDigit: (input at: pos). pos := pos + 1.
			(digit < 0 or: [ digit >= base ]) ifTrue: [ ^ nil ].
			i := i + (digit * w).
			t := k <= bias ifTrue: [ 1 ] ifFalse: [ (k >= (bias + 26)) ifTrue: [ 26 ] ifFalse: [ k - bias ] ].
			digit < t ifTrue: [ done := true ] ifFalse: [ w := w * (base - t). k := k + base ] ].
		outLen := output size + 1.
		bias := self punycodeAdapt: i - oldi numPoints: outLen firstTime: oldi = 0.
		n := n + (i // outLen). i := i \\ outLen.
		(n < 0 or: [ n > 1114111 ]) ifTrue: [ ^ nil ].
		output add: (Character value: n) beforeIndex: i + 1.
		i := i + 1 ].
	^ String withAll: output
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> punycodeDigit: aChar [
	| v |
	v := aChar asInteger.
	(v between: 65 and: 90) ifTrue: [ ^ v - 65 ].
	(v between: 97 and: 122) ifTrue: [ ^ v - 97 ].
	(v between: 48 and: 57) ifTrue: [ ^ v - 22 ].
	^ -1
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid idn-hostname' ]
]

{ #category : 'validation' }
JSONFormatIDNHostname class >> viramaCodePoints [
	"Canonical-combining-class 9 (virama) code points, used by the ZWJ/ZWNJ CONTEXTJ rules."
	^ #(16r94D 16r9CD 16rA4D 16rACD 16rB4D 16rBCD 16rC4D 16rCCD 16rD4D 16rDCA 16rE3A 16rEBA 16rF84 16r1039 16r103A 16r17D2 16r1A60 16r1B44 16r1BAA 16r2D7F 16rA806 16rA8C4 16rA953 16rA9C0 16rAAF6 16rABED) asSet
]
