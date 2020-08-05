actions
generateTestCases
	[ :job | 
	job max: self files size.
	self files
		do: [ :file | 
			job
				increment;
				title: 'Processing file ' , file fileName.
			file generateCode ] ] asJob run