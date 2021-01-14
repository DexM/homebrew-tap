class DotnetCoreUninstall < Formula
  desc "A tool for uninstalling versions of the .NET Core SDK, runtime, etc."
  homepage "https://github.com/dotnet/cli-lab"
  url "https://github.com/dotnet/cli-lab/releases/download/1.2.206301/dotnet-core-uninstall.tar.gz"
  sha256 "d99d6e6b0d2dcdb1882e4bd5dbef71b0c22c569e6d70c19a1fcc073f4aea32db"
  license "MIT"

  bottle :unneeded

  def install
    bin.install "dotnet-core-uninstall"
  end

  test do
      assert_equal "1.2.0", shell_output("dotnet-core-uninstall --version").strip
  end
end
