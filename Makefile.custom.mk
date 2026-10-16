# Chart unit tests. `make test` runs them too, so CI's go-build job does.
#
# Deliberately does not depend on the generated `lint-chart`: that one needs
# docker with a TTY plus `architect`, so it does not run on a plain runner.
#
# APPLICATION, the chart directory name, comes from Makefile.gen.go.mk.

HELM_UNITTEST_VERSION ?= v1.1.1

##@ Chart testing

test: helm-unittest

.PHONY: helm-unittest
helm-unittest: helm-plugin-unittest ## Run the helm-unittest suites in helm/$(APPLICATION)/tests/.
	@echo "====> $@"
	@helm unittest helm/$(APPLICATION)

# Helm 4 refuses to install a plugin from a git URL without --verify=false,
# and Helm 3 does not know the flag.
.PHONY: helm-plugin-unittest
helm-plugin-unittest:
	@helm plugin list | grep -q '^unittest' || \
		helm plugin install https://github.com/helm-unittest/helm-unittest --version $(HELM_UNITTEST_VERSION) \
			$$(helm version --template '{{.Version}}' | grep -q '^v3\.' || echo --verify=false)
