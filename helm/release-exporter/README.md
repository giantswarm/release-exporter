# release-exporter

A Helm chart for release-exporter

**Homepage:** <https://github.com/giantswarm/release-exporter>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.registry | string | `"gsoci.azurecr.io"` |  |
| image.name | string | `"giantswarm/release-exporter"` |  |
| image.tag | string | `""` |  |
| cortex.url | string | `""` |  |
| cortex.username | string | `""` |  |
| cortex.password | string | `""` |  |
| updateCacheEvery | string | `"30m"` |  |
