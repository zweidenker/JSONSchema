tests
testSizeOpenMinimum
	| constraint |
	constraint := JSONSchemaSizeConstraint new
		maxProperties: 10.
	self
		shouldnt: [ constraint
				validate:
					{('a' -> 1).
					('b' -> 2).
					('c' -> 3)} asDictionary ]
		raise: JSONConstraintError