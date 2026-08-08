cask "apple-container" do
  version "1.2.2"
  sha256 "f4c7e73f7203725a3512676dfd9ec6c6a98a37093b6fd4a1b0fdcfcb227e2118"

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
