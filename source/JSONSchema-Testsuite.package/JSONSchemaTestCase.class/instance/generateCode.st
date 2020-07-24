as yet unclassified
generateCode
	| class |
	class := TestCase
		subclass: self generatedClassName
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'JSONSchema-Testsuite-Tests'.
	methods do: [ :each | each generateCode: class ]