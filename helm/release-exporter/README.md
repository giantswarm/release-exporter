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
| architecture | string | `""` | Target CPU architecture for this workload. Empty imposes no constraint. `arm64` pins the pod to arm64 nodes, adding both the `kubernetes.io/arch` node selector and the toleration for the `kubernetes.io/arch=arm64:NoSchedule` taint that Giant Swarm arm64 node pools carry. Both are required, so this single value sets both. Requires a multi-arch container image; an amd64-only image will crash-loop with `exec format error` on an arm64 node. |
| nodeSelector | object | `{}` | Node selector for pod scheduling. Merged with `architecture`. Pinning to arm64 here rather than through `architecture` also adds the arm64 taint toleration, so either route is safe. A value that contradicts `architecture` fails the render. |
| tolerations | list | `[]` | Tolerations for pod scheduling. Merged with the toleration that `architecture: arm64` adds. |
