Class {
	#name : #JiraClient,
	#superclass : #OpenApiClient,
	#classInstVars : [
		'api'
	],
	#category : #'Jira-Core'
}

{ #category : #accessing }
JiraClient class >> api [ 
	^ "api ifNil: [ 
		api := "OpenAPI readFrom: 'swagger-v3.v3.json' asFileReference readStream "]"
]

{ #category : #accessing }
JiraClient >> openApi [ 
	^ openApi ifNil: [ 
		openApi := self class api ]
]

{ #category : #'as yet unclassified' }
JiraClient >> prepare [
	| api schema |
	api := self openApi.
	schema := api componentAt: 'IssueBean'.
	schema instanceClass: JiraIssue 
]

{ #category : #querying }
JiraClient >> ticketWithKey: aString [ 
	^ self 
		call: 'com.atlassian.jira.rest.v2.issue.IssueResource.getIssue_get' 
		withArguments: { #issueIdOrKey -> aString }.

]
