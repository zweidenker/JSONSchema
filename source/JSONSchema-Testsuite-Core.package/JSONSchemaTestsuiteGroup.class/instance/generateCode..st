code generation
generateCode: packageName
	| class |
	[ :job | 
	job max: self tests size + 1.
	class := self createClass: packageName.
	job
		increment;
		title: 'Generating #schemaString'.
	self compileSchemaMethod: class.
	self tests
		do: [ :test | 
			job
				increment;
				title: 'Generating #' , test testMethodName.
			test generateCode: class ] ] asJob run