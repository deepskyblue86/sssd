# sssd container

Very basic [SSSD](https://sssd.io/docs/architecture.html) container.
It comes with a default config providing nss files provider.

## Rationale
The main usecase is being able to access to the host users / groups information from another container.

As a requirement, the other container will need to have `libnss_sss` and `/var/lib/sss` volume bind (readonly).
In a debian-based container it's provided by `libnss-sss`, while on fedora-based it's provided by `sssd-client`.


## How to run
```
docker run -d --privileged --name sssd -v /etc:/etc:ro -v /var/lib/sss:/var/lib/sss ghcr.io/deepskyblue86/sssd:latest
```
- `-v /etc:/etc:ro` is to provide access to `/etc/passwd`, but also to be able to access to any other config that might be useful for other settings
- `-v /var/lib/sss:/var/lib/sss` is the actual storage
