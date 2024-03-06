# Neovim build

The idea behind this is that I wanted to build Neovim on my own and use it on a custom container of mine, running on top of a cluster of ARM-based servers. Since the latest versions of Neovim do not support the ARM architecture, I created this simple workaround.

It's based on a simple Dockerfile for building Neovim from scratch, based on the specified version, and then allowing you to get the binary from the image.


### Getting binary to the local machine
```shell
docker run --rm "caduedu14/neovim-build " cat /nvim > nvim # This will copy the binary to your machine
chmod +x nvim # just give it execute permission
./nvim --version # Then test it
```

### Build image
For building the image itself, it's pretty simple as well.

```shell
# just don't forget to change the username here lol
docker build . -t caduedu14/neovim-build:v0.9.5 \
        --build-arg NVIM_VERSION=v0.9.5\
        --no-cache
```

### Copy from this image in another Dockerfile

And if your use case is to copy the content to a new container image being created, just use it like this:

```dockerfile
FROM your_super_image:latest

# All your awesome stuff here

COPY --from=caduedu14/neovim-build:v0.9.5
```

