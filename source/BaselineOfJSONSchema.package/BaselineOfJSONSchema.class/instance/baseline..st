baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'JSONSchema-Core' with: [ spec requires: #('NeoJSON') ];
				package: 'JSONSchema-Core-Tests' with: [ spec requires: #('JSONSchema-Core') ];
				package: 'JSONSchema-Testsuite-Core' with: [ spec requires: #('JSONSchema-Core') ];
				package: 'JSONSchema-Testsuite-Tests' with: [ spec requires: #('JSONSchema-Core' 'JSONSchema-Testsuite-Core') ];

				baseline: 'NeoJSON' with: [ spec repository: 'github://svenvc/NeoJSON:master/repository' ].

			spec
				group: 'default' with: #('Core' 'Tests');
				group: 'Core' with: #('JSONSchema-Core');
				group: 'Tests' with: #('JSONSchema-Core-Tests');
				group: 'Testsuite' with: #('JSONSchema-Testsuite-Core' 'JSONSchema-Testsuite-Tests'). ].