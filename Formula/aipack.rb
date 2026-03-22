class Aipack < Formula
  desc "Portable AI agent configuration pack manager"
  homepage "https://github.com/shrug-labs/aipack"
  version "0.11.3"
  license "UPL-1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-arm64"
    sha256 "b8a7eadcbf4d12f64aba375d95d6ef4d97338c15b3e050262b990696a4b8a4da"
  elsif OS.mac?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-amd64"
    sha256 "beed68730393b23f3687331948fcaea0e86b0c7bb245de6e431f91cfbe7139e9"
  else
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-linux-amd64"
    sha256 "ec0b7b722aa61822cf719eab031891a4cdae6bd3aead4c176aabd41f0904610d"
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
