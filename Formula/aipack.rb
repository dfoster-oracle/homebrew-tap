class Aipack < Formula
  desc "Portable AI agent configuration pack manager"
  homepage "https://github.com/shrug-labs/aipack"
  version "0.28.1"
  license "UPL-1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-arm64"
    sha256 "e819422636dfd13b7df4b534052ac14c393d758ad0333538d9fc4880b74c4552"
  elsif OS.mac?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-amd64"
    sha256 "306735e401906adfa70f9c4313643af59694f77b0795c4083452eb2292355481"
  else
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-linux-amd64"
    sha256 "97552adecc663c5c2ca703533fd708967b0e636a78cd5fb8b6699508d9b0900c"
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
