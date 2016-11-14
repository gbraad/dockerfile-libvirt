Containerized libvirt
=====================

Usage
-----

### Run daemon

```sh
$ docker run \
  -d \
  --privileged \
  --name libvirtd \
  -v /var/lib/libvirt:/var/lib/libvirt \
  registry.gitlab.com/gbraad/libvirt:daemon
```

Note: port 16509 can be exposed for external use.


### Run client

```
$ docker run -it \
  --link libvirtd:libvirtd \
  registry.gitlab.com/gbraad/libvirt:client
```


### Stop daemon

```sh
$ docker stop libvirtd
```
