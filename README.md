# My Homebrew Tap

[Install Homebrew](https://brew.sh), then:
```sh
brew tap dexm/tap
```

## Casks

|Cask|Software|Comments|
|-|-|-|
|[`apple-container`](Casks/apple-container.rb)|[Apple Container](https://github.com/apple/container)|[Homebrew `container` Formula](https://github.com/Homebrew/homebrew-core/blob/main/Formula/c/container.rb) builds `container` from source and does not use provided installer. This Cask uses installer instead.|
|[`docker-desktop`](Casks/docker-desktop.rb)|[Docker Desktop](https://www.docker.com/products/docker-desktop)|Same as [official Homebrew Cask](https://github.com/Homebrew/homebrew-cask/blob/main/Casks/d/docker-desktop.rb), but does not install symlinks automatically (Docker Desktop will do that itself on the first launch).|
