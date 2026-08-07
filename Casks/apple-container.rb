cask "apple-container" do
  version "1.2.1"
  sha256 "e7ca16c7b23034522505f5ce8266235db3c32a2e9a88d3fc5ee9a402bfc63eb2"

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
