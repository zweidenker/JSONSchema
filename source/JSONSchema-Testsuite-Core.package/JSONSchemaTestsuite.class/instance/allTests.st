accessing
allTests
	^ (JSONSchemaTestsuiteTestCollector visit: self) tests