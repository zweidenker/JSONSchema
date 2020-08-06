actions
generateExpectedFailures
	self allSubclasses
		do: [ :class | 
			| result expectedFailures methodName |
			result := class suite run.
			expectedFailures := result failures , result errors
				collect: #selector.
			methodName := class
				compile:
					'expectedFailures
        ^ ' , expectedFailures asArray printString.
			(class >> methodName)
				protocol: 'testing';
				reformat ]