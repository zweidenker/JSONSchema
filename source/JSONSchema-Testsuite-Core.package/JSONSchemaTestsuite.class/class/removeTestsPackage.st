private
removeTestsPackage
	(RPackageOrganizer default
		includesPackageNamed: self testsPackageName)
		ifTrue: [ RPackageOrganizer default
				unregisterPackageNamed: self testsPackageName ]