tests
testSizeTooSmallForRange
	| constraint |
	constraint := JSONSchemaSizeConstraint new
		minProperties: 4;
		maxProperties: 10.
	self
		should: [ constraint
				validate:
					{('a' -> 1).
					('b' -> 2).
					('c' -> 3)} asDictionary ]
		raise: JSONConstraintError