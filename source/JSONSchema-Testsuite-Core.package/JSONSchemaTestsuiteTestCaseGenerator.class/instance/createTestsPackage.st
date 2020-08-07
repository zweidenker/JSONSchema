code generation
createTestsPackage
	(RPackageOrganizer default
		includesPackageNamed: self class testsPackageName)
		ifFalse: [ RPackageOrganizer default
				createPackageNamed: self class testsPackageName ]