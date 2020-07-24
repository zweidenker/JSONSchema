tests
testSizeOpenMaximum
	| constraint |
	constraint := JSONSchemaSizeConstraint new
		minProperties: 2.
	self
		shouldnt: [ constraint
				validate:
					{('a' -> 1).
					('b' -> 2).
					('c' -> 3)} asDictionary ]
		raise: JSONConstraintError