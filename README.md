# My Homebrew Tap

[Install Homebrew](https://brew.sh), then:
```sh
brew tap dexm/tap
```

## Casks

|Cask|Software|Comments|
|-|-|-|
|[`apple-container`](Casks/apple-container.rb)|[Apple Container](https://github.com/apple/container)|[Homebrew `container` Formula](https://github.com/Homebrew/homebrew-core/blob/main/Formula/c/container.rb) builds `container` from source and does not use provided installer. This Cask uses installer instead.|
|[`docker-desktop-clean`](Casks/docker-desktop-clean.rb)|[Docker Desktop](https://www.docker.com/products/docker-desktop)|Based on [official Homebrew Cask](https://github.com/Homebrew/homebrew-cask/blob/main/Casks/d/docker-desktop.rb). Changes:<ul><li>does not install symlinks automatically (Docker Desktop will do that itself on the first launch)</li><li>installs shell completions for `kubectl`</li></ul>|

> :information_source: Homebrew Casks must have globally unique names. Even Casks in different taps should ideally have unique names.
