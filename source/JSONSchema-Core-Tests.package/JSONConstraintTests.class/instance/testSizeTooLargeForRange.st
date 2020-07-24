tests
testSizeTooLargeForRange
	| constraint |
	constraint := JSONSchemaSizeConstraint new
		minProperties: 1;
		maxProperties: 2.
	self
		should: [ constraint
				validate:
					{('a' -> 1).
					('b' -> 2).
					('c' -> 3)} asDictionary ]
		raise: JSONConstraintError