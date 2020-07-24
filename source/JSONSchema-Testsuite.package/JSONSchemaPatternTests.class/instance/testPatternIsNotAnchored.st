as yet unclassified
testPatternIsNotAnchored
	"pattern is not anchored"

	| schema data |
	schema := JSONSchema fromString: '{"pattern":"a+"}'.
	"matches a substring"
	data := NeoJSONReader fromString: '"xxaayy"'.
	schema validate: data