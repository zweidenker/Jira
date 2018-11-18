Class {
	#name : #BaselineOfJira,
	#superclass : #BaselineOf,
	#category : #BaselineOfJira
}

{ #category : #baselines }
BaselineOfJira >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: #OpenAPI with: [ 
				spec 
					repository: 'github://zweidenker/OpenAPI/source';
					loads: 'Client' ].
		spec package: 'Jira-Core' with: [ 
			spec requires: #( 'OpenAPI' ) ] ]
]
