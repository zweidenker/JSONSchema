code generation
generateCode
	[ :job | 
	job max: self groups size.
	self groups
		do: [ :group | 
			job
				increment;
				title: 'Generating ' , group testCaseClassName.
			group generateCode: self packageName ] ] asJob run