cask "docker-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "4.81.0,232925"
  sha256 arm:   "a35a0b14fbf182fb2ef9f8e650ace9a8ebcc81ad4872d51bccc4496f5cdb0158",
         intel: "03573c71f56842889c3b3002d51026ad9b8b454f2feed0d8af2c1eb90846077d"

  on_intel do
    binary "#{appdir}/Docker.app/Contents/Resources/bin/com.docker.hyperkit",
           target: "/usr/local/bin/hyperkit"
  end

  url "https://desktop.docker.com/mac/main/#{arch}/#{version.csv.second}/Docker.dmg"
  name "Docker Desktop"
  name "Docker Community Edition"
  name "Docker CE"
  desc "App to build and share containerised applications and microservices"
  homepage "https://www.docker.com/products/docker-desktop"

  livecheck do
    url "https://desktop.docker.com/mac/main/#{arch}/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  conflicts_with cask: "rancher"
  depends_on macos: :sonoma

  app "Docker.app"
  bash_completion "#{appdir}/Docker.app/Contents/Resources/etc/docker-compose.bash-completion"
  bash_completion "#{appdir}/Docker.app/Contents/Resources/etc/docker.bash-completion"
  fish_completion "#{appdir}/Docker.app/Contents/Resources/etc/docker-compose.fish-completion"
  fish_completion "#{appdir}/Docker.app/Contents/Resources/etc/docker.fish-completion"
  zsh_completion "#{appdir}/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion"
  zsh_completion "#{appdir}/Docker.app/Contents/Resources/etc/docker.zsh-completion"

  uninstall launchctl: [
              "com.docker.helper",
              "com.docker.socket",
              "com.docker.vmnetd",
            ],
            quit:      [
              "com.docker.docker",
              "com.electron.dockerdesktop",
            ],
            delete:    [
              "/Library/PrivilegedHelperTools/com.docker.socket",
              "/Library/PrivilegedHelperTools/com.docker.vmnetd",
              "/usr/local/bin/docker",
              "/usr/local/bin/docker-compose",
              "/usr/local/bin/docker-credential-desktop",
              "/usr/local/bin/docker-credential-ecr-login",
              "/usr/local/bin/docker-credential-osxkeychain",
              "/usr/local/bin/kubectl",
              "/usr/local/bin/kubectl.docker",
            ],
            rmdir:     "~/.docker/bin"

  zap trash: [
        "~/.docker",
        "~/Library/Application Scripts/com.docker.helper",
        "~/Library/Application Scripts/group.com.docker",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.docker.helper.sfl*",
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.electron.dockerdesktop.sfl*",
        "~/Library/Application Support/com.bugsnag.Bugsnag/com.docker.docker",
        "~/Library/Application Support/Docker Desktop",
        "~/Library/Application Support/docker-secrets-engine",
        "~/Library/Caches/com.docker.docker",
        "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.docker.docker",
        "~/Library/Caches/Docker Desktop",
        "~/Library/Caches/docker-secrets-engine",
        "~/Library/Caches/KSCrashReports/Docker",
        "~/Library/Containers/com.docker.docker",
        "~/Library/Containers/com.docker.helper",
        "~/Library/Group Containers/group.com.docker",
        "~/Library/HTTPStorages/com.docker.docker",
        "~/Library/HTTPStorages/com.docker.docker.binarycookies",
        "~/Library/Logs/Docker Desktop",
        "~/Library/Preferences/com.docker.docker.plist",
        "~/Library/Preferences/com.electron.docker-frontend.plist",
        "~/Library/Preferences/com.electron.dockerdesktop.plist",
        "~/Library/Saved Application State/com.electron.docker-frontend.savedState",
        "~/Library/Saved Application State/com.electron.dockerdesktop.savedState",
      ],
      rmdir: [
        "~/Library/Caches/com.plausiblelabs.crashreporter.data",
        "~/Library/Caches/KSCrashReports",
      ]
end
