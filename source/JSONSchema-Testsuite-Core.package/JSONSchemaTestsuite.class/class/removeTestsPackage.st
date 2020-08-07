private
removeTestsPackage
	(RPackageOrganizer default
		includesPackageNamed: JSONSchemaTestsuiteTestCaseGenerator testsPackageName)
		ifTrue: [ RPackageOrganizer default
				unregisterPackageNamed: JSONSchemaTestsuiteTestCaseGenerator testsPackageName ]