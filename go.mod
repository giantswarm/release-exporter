module github.com/giantswarm/release-exporter

go 1.26.0

toolchain go1.27.1

require (
	github.com/Masterminds/semver/v3 v3.5.0
	github.com/prometheus/client_golang v1.25.0
	gopkg.in/yaml.v3 v3.0.1
)

require (
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/prometheus/client_model v0.6.3 // indirect
	github.com/prometheus/common v0.72.0 // indirect
	github.com/prometheus/procfs v0.22.0 // indirect
	golang.org/x/sys v0.48.0 // indirect
	google.golang.org/protobuf v1.36.12 // indirect
)

// CVE-2026-56852 / GO-2026-5970: infinite loop in golang.org/x/text/unicode/norm
// on invalid UTF-8 input. x/text is pulled in transitively via
// prometheus/client_golang and prometheus/common and is not reachable from this
// module's packages, so `go get` + `go mod tidy` cannot raise it -- module-graph
// pruning drops the unused require and the selected version falls back. nancy
// audits the whole module graph and gates go-build, so pin it here.
replace golang.org/x/text => golang.org/x/text v0.43.0
