# SSHD

[![Docker Repository on Quay.io](https://quay.io/repository/elifarley/jdk8-sshd/status "Docker Repository on Quay.io")](https://quay.io/repository/elifarley/jdk8-sshd)

Minimal Alpine Linux Docker container with `sshd` exposed and `rsync` installed.

Mount your .ssh credentials (RSA public keys) at `/root/.ssh/` in order to access the container via root ssh.

Optionally mount a custom ssh config at `/root/ssh-config`.

Optionally mount a custom sshd config at `/etc/ssh/`.

## Usage Example

```
docker run -d -p 2222:22 -v ~/.ssh/id_rsa.pub:/root/ssh-config/authorized_keys:ro -v /slave/ --name jdk8-sshd quay.io/elifarley/jdk8-sshd
````
