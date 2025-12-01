# illuminati_helm_charts
This repository contains Helm charts and default values for deploying Illuminati applications to Kubernetes. Each application has its own chart folder and can be deployed using Helm or managed with ArgoCD.
- Some applications depend on existing cluster resources such as databases, secrets, or DNS. To see required resources, check the [Illuminati cluster infrastructure repository](https://github.com/Core5-team/illuminati_eks).
- ArgoCD Applications are defined in this [repository](https://github.com/Core5-team/illuminati_gitops).

## Requirements

- Kubernetes cluster with the illuminati namespace created:

```kubectl create namespace illuminati```

- Cluster resources (secrets, databases, DNS) must exist as described in the cluster infrastructure repo.

## Setup

1. Clone this repository:

```git clone https://github.com/Core5-team/illuminati_helm_charts.git```
```cd illuminati_helm_charts```

2. Review default values for each application in its values.yaml file.
3. Deploy applications with Helm or ArgoCD.

### Deploy with Helm

To install an application (replace ```<app-folder>``` with the chart folder name):

```helm install <app-name> ./<app-folder> -n illuminati```

To upgrade after changes:

```helm upgrade <app-name> ./<app-folder> -n illuminati```

The charts include:

- Backend chart: deploys backend Deployment, Service and Horizontal Pod Autoscaler. Uses secrets for database credentials.

- Frontend chart: deploys frontend Deployment, Service and Horizontal Pod Autoscaler. Configurable ports and health checks.

- Other charts: new apps can be added with their own Chart.yaml, values.yaml and templates directory.

Each chart defines:

- Deployment with configurable container image, resources, ports and health probes

- Service (ClusterIP) to expose pods internally

- Horizontal Pod Autoscaler (HPA) based on CPU and memory utilization

### Deploy with ArgoCD

1. Open the ArgoCD UI or use the CLI.
2. Create a new Application pointing to the chart folder in this repo.
3. Set the namespace to ```illuminati``` and configure sync options.
4. Sync the Application to deploy.

For examples and predefined ArgoCD Applications, see the [Illuminati ArgoCD repository](https://github.com/Core5-team/illuminati_gitops).


