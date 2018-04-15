class ResetLaunchpad < Formula
    desc "Reset macOS launchpad"
    homepage "https://github.com/DexM/ResetLaunchpad"
    url "https://github.com/DexM/ResetLaunchpad/archive/v0.1.tar.gz"
    sha256 "91716c13e0dcc9afd548f845fea04d5333ce5342bfc6e584eded8cc022d2a865"

    bottle :unneeded

    def install
        libexec.install "reset-launchpad.sh"
        bin.install_symlink libexec/"reset-launchpad.sh" => "reset-launchpad"
    end

    test do
        system "true"
    end
end
