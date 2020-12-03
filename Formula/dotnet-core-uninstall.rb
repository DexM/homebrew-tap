class DotnetCoreUninstall < Formula
  desc "A tool for uninstalling versions of the .NET Core SDK, runtime, etc."
  homepage "https://github.com/dotnet/cli-lab"
  url "https://github.com/dotnet/cli-lab/releases/download/1.1.122401/dotnet-core-uninstall.tar.gz"
  sha256 "d3368caf3bcf32179a4e0826b6ab7cc545b5f4d56ed59667fe018b2df4354831"
  license "MIT"

  bottle :unneeded

  def install
    bin.install "dotnet-core-uninstall"
  end

  test do
      assert_equal "1.1.0", shell_output("dotnet-core-uninstall --version").strip
  end
end
