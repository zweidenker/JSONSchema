cleanup
cleanUp
	| package |
	package := Smalltalk packages
		detect: [ :each | each name = #'JSONSchema-Testsuite' ]
		ifNone: [ ^ self ].
	(package classesForClassTag: #Tests)
		do: [ :each | each removeFromSystem ]