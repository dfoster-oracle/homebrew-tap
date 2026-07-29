class Aipack < Formula
  desc "Portable AI agent configuration pack manager"
  homepage "https://github.com/shrug-labs/aipack"
  version "0.33.3"
  license "UPL-1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-arm64"
    sha256 "94de8b084fdfa024f0621936bf08cb6d3a7526e8255549bd37b9fc4be4da7994"
  elsif OS.mac?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-amd64"
    sha256 "fbf3269b832aff0bb697f0b851b0c06adb66e04bd36330f72c5c87f90323b275"
  else
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-linux-amd64"
    sha256 "e70b46b916fd33642fc359d28cc8224b9b0d810d630644dde1d6f9a499d30120"
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "aipack-darwin-arm64" : "aipack-darwin-amd64"
    else
      "aipack-linux-amd64"
    end

    bin.install binary_name => "aipack"
  end

  test do
    assert_match "aipack #{version}", shell_output("#{bin}/aipack version")
  end
end
