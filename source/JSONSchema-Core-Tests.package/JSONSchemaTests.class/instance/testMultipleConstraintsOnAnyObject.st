tests
testMultipleConstraintsOnAnyObject
	| schema |
	schema := JSONSchema
		fromString:
			'{"minProperties":2,"maxProperties":2,"minItems":4,"maxItems":4,"minLength":6,"maxLength":6}'.
	self
		should: [ schema validate: {'a'->1} asDictionary  ] raise: JSONConstraintError;
		shouldnt: [ schema validate:  {'a'->1. 'b' ->2} asDictionary  ] raise: JSONConstraintError;
		should: [ schema validate: {'a'->1. 'b' ->2. 'c'->3} asDictionary] raise: JSONConstraintError.
	self
		should: [ schema validate: #(1 2 3) ] raise: JSONConstraintError;
		shouldnt: [ schema validate: #(1 2 4) ] raise: JSONConstraintError;
		should: [ schema validate: #(1 2 3 4 5) ] raise: JSONConstraintError.
	self
		should: [ schema validate: '12345' ] raise: JSONConstraintError;
		shouldnt: [ schema validate: '123456' ] raise: JSONConstraintError;
		should: [ schema validate: '1234567' ] raise: JSONConstraintError