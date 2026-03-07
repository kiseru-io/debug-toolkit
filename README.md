# debug-toolkit

### Status
[![Build and Push](https://github.com/kiseru-io/debug-toolkit/actions/workflows/docker.yml/badge.svg)](https://github.com/kiseru-io/debug-toolkit/actions/workflows/docker.yml)

A prebaked image containing useful tools such as -

- sslyze
- nmap
- httpie

## Run locally

Pull the image from GitHub Container Registry and run:

```
docker run -it --rm ghcr.io/kiseru-io/debug-toolkit:latest /bin/bash
```

## Run inside k8s

If you want to run inside your current k8s cluster, simply deploy using

```
kubectl create -f https://raw.githubusercontent.com/kiseru-io/debug-toolkit/master/debug-toolkit.yml
```

Update the image in `debug-toolkit.yml` to use GHCR:

```yaml
image: ghcr.io/kiseru-io/debug-toolkit:latest
```

Verify that the debug-toolkit Pod is running

```
$ kubectl get pods 
NAME                                      READY     STATUS             RESTARTS   AGE
debug-toolkit                             1/1       Running            0          15m
```

To connect just exec to the running instance 

```
kubectl exec -it debug-toolkit /bin/bash
```
