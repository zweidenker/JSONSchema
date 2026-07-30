Class {
	#name : 'JSONFormatURI',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatURI class >> basicConvertString: aString [ 
	^ aString asZnUrl 
]

{ #category : 'as yet unclassified' }
JSONFormatURI class >> encodeJSON: aZnURL [
	^ aZnURL asString
	
]

{ #category : 'formatting' }
JSONFormatURI class >> formatName [ 
	^ #uri
]

{ #category : 'validation' }
JSONFormatURI class >> isValidURIAuthority: anAuthority [
	"authority = [ userinfo @ ] host [ : port ]. Necessary check: after stripping any
	userinfo, an unbracketed host has at most one colon with a numeric port (so a bare
	IPv6 without [] is rejected), and a bracketed IP-literal must be closed."
	| hostport at rest colon |
	at := anAuthority lastIndexOf: $@.
	hostport := at = 0 ifTrue: [ anAuthority ] ifFalse: [ anAuthority copyFrom: at + 1 to: anAuthority size ].
	(hostport notEmpty and: [ hostport first = $[ ]) ifTrue: [
		| close | close := hostport indexOf: $].
		close = 0 ifTrue: [ ^ false ].
		rest := hostport copyFrom: close + 1 to: hostport size.
		^ rest isEmpty or: [ rest first = $: and: [ rest allButFirst allSatisfy: [ :c | c isDigit ] ] ] ].
	colon := hostport indexOf: $:.
	^ colon = 0 or: [ (hostport copyFrom: colon + 1 to: hostport size) allSatisfy: [ :c | c isDigit ] ]
]

{ #category : 'validation' }
JSONFormatURI class >> isValidURIScheme: aScheme [
	"scheme = ALPHA *( ALPHA / DIGIT / + / - / . )"
	^ aScheme notEmpty
		and: [ ((aScheme first between: $a and: $z) or: [ aScheme first between: $A and: $Z ])
		and: [ aScheme allSatisfy: [ :c |
			(c between: $a and: $z) or: [ (c between: $A and: $Z)
				or: [ c isDigit or: [ '+-.' includes: c ] ] ] ] ] ]
]

{ #category : 'validation' }
JSONFormatURI class >> isValidURIString: aString allowUnicode: allowUnicode [
	"RFC 3986 URI (RFC 3987 IRI when allowUnicode): a reference carrying a scheme. A
	necessary structural check - legal characters, a valid scheme, and a well-formed
	authority when the scheme is followed by //."
	| colon scheme afterScheme authority rest endIdx |
	(aString allSatisfy: [ :ch |
		(self legalURICharacters includes: ch) or: [ allowUnicode and: [ ch asInteger > 127 ] ] ])
			ifFalse: [ ^ false ].
	colon := aString indexOf: $:.
	colon = 0 ifTrue: [ ^ false ].
	scheme := aString copyFrom: 1 to: colon - 1.
	(self isValidURIScheme: scheme) ifFalse: [ ^ false ].
	afterScheme := aString copyFrom: colon + 1 to: aString size.
	(afterScheme beginsWith: '//') ifFalse: [ ^ true ].
	rest := afterScheme copyFrom: 3 to: afterScheme size.
	endIdx := (1 to: rest size) detect: [ :i | '/?#' includes: (rest at: i) ] ifNone: [ rest size + 1 ].
	authority := rest copyFrom: 1 to: endIdx - 1.
	^ self isValidURIAuthority: authority
]

{ #category : 'validation' }
JSONFormatURI class >> legalURICharacters [
	"The RFC 3986 character repertoire: unreserved, gen-/sub-delims and the pct marker."
	^ 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~:/?#[]@!$&''()*+,;=%'
]

{ #category : 'services' }
JSONFormatURI class >> validate: aUrl [
	(aUrl isKindOf: ZnUrl) ifFalse: [ 
		JSONTypeError
			signal: aUrl printString , ' is not a URL' ]
	
]

{ #category : 'validation' }
JSONFormatURI class >> validateString: aString [
	(self isValidURIString: aString allowUnicode: false) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid uri' ]
]

{ #category : 'writing' }
JSONFormatURI class >> write: aZnUrl [
	^ aZnUrl asString
]
