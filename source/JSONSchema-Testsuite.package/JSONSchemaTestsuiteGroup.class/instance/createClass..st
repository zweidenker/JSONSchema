private
createClass: packageName
	^ JSONSchemaTestsuiteTestCase
		subclass: self testCaseClassName
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName