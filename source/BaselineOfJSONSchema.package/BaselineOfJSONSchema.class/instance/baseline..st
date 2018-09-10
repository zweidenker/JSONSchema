baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ ""
			spec
				package: 'JSONSchema-Core' with: [ spec requires: #('NeoJSON'). ];
				package: 'JSONSchema-Core-Tests' with: [ spec requires: #('JSONSchema-Core' 'Mocketry'). ];

				project: 'NeoJSON'
					with: [ spec
						className: #ConfigurationOfNeoJSON;
						versionString: '17';
						repository: 'http://mc.stfx.eu/Neo'. ].

			spec baseline: 'Mocketry' with: [ spec repository: 'github://dionisiydk/Mocketry:v4.0.x'. ].

			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('JSONSchema-Core');
				group: 'Tests' with: #('JSONSchema-Core-Tests'). ].