visiting
visitSuite: aJSONSchemaTestsuite
	[ :job | 
	| files |
	files := aJSONSchemaTestsuite files.
	job max: files size.
	self
		createTestsPackage;
		createGroupClassNameMapping: aJSONSchemaTestsuite.
	files
		do: [ :file | 
			job
				increment;
				title: 'Processing file ' , file fileName.
			file acceptVisitor: self ] ] asJob run