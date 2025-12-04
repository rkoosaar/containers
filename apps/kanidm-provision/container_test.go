package main

import (
	"context"
	"testing"

	"github.com/rkoosaar/containers/testhelpers"
)

func TestKanidmProvisionCLI(t *testing.T) {
	ctx := context.Background()

	image := testhelpers.GetTestImage("ghcr.io/rkoosaar/kanidm-provision:rolling")
	testhelpers.TestFileExists(t, ctx, image, "/usr/local/bin/kanidm-provision", nil)
	testhelpers.TestCommandSucceeds(t, ctx, image, nil, "kanidm-provision", "--help")
}
