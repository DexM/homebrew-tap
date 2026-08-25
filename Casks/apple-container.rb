cask "apple-container" do
  version "1.3.0"
  sha256 "bd156250cb84061367ed4b0eeef52211b6a825c6e0728a9426e57602ddb089c1"

  url "https://github.com/apple/container/releases/download/#{version}/container-#{version}-installer-signed.pkg"
  name "Apple Container"
  desc "Create and run Linux containers using lightweight virtual machines"
  homepage "https://github.com/apple/container"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  pkg "container-#{version}-installer-signed.pkg"

  uninstall_preflight do
    container_bin="/usr/local/bin/container"
    next unless File.executable?(container_bin)

    system_command container_bin,
                   args: ["system", "stop"]
  end

  uninstall script: {
    executable: "/usr/local/bin/uninstall-container.sh",
    args:       ["-k"],
    sudo:       true,
  }

  zap script: {
        executable:   "defaults",
        args:         ["delete", "com.apple.container.defaults"],
        must_succeed: false,
      },
      trash:  "~/Library/Application Support/com.apple.container"
end
