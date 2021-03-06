﻿Feature: Deleting snapshots
	Deleting existing snapshots soft-deletes all relevant documents so the changes are present in Cosmos DB Change Feed

Scenario: Deleting some snapshots
	Given an event store backed by partitioned collection
	And an existing stream P with 10 events
	And an existing snapshot for version 5
	And an existing stream S with 10 events
	And an existing snapshot for version 1
	And an existing snapshot for version 3
	And an existing snapshot for version 5
	And an existing snapshot for version 7
	When I delete snapshots older than version 5 from stream S
	Then the snapshots older than 5 are soft-deleted
	And snapshots 5 and newer are not soft-deleted
	And stream P is not soft-deleted
	And request charge is reported
	And 2 deleted documents are reported

Scenario: Deleting all snapshots
	Given an event store backed by partitioned collection
	And an existing stream P with 10 events
	And an existing snapshot for version 5
	And an existing stream S with 10 events
	And an existing snapshot for version 1
	And an existing snapshot for version 3
	And an existing snapshot for version 5
	And an existing snapshot for version 7
	When I delete snapshots older than version 999999 from stream S
	Then the snapshots older than 10 are soft-deleted
	And stream P is not soft-deleted
	And request charge is reported
	And 4 deleted documents are reported

Scenario: Hard-deleting some snapshots
	Given hard-delete mode
	And an event store backed by partitioned collection
	And an existing stream P with 10 events
	And an existing snapshot for version 5
	And an existing stream S with 10 events
	And an existing snapshot for version 1
	And an existing snapshot for version 3
	And an existing snapshot for version 5
	And an existing snapshot for version 7
	When I delete snapshots older than version 5 from stream S
	Then the snapshots older than 5 are hard-deleted
	And snapshots 5 and newer are not hard-deleted
	And stream P is not hard-deleted
	And request charge is reported
	And 2 deleted documents are reported

Scenario: Hard-Deleting all snapshots
	Given hard-delete mode
	And an event store backed by partitioned collection
	And an existing stream P with 10 events
	And an existing snapshot for version 5
	And an existing stream S with 10 events
	And an existing snapshot for version 1
	And an existing snapshot for version 3
	And an existing snapshot for version 5
	And an existing snapshot for version 7
	When I delete snapshots older than version 999999 from stream S
	Then the snapshots older than 10 are hard-deleted
	And stream P is not hard-deleted
	And request charge is reported
	And 4 deleted documents are reported