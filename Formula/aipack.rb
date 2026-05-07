class Aipack < Formula
  desc "Portable AI agent configuration pack manager"
  homepage "https://github.com/shrug-labs/aipack"
  version "0.27.0"
  license "UPL-1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-arm64"
    sha256 "6312f4cd0756c9f3214ad3ffdb005c39ba1002e563c3ebe927c8b379b83dffd4"
  elsif OS.mac?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-amd64"
    sha256 "32a97d678f9bff6bb38d1477110ede1bb5483f76c5133a01ee3eef6b2bac9283"
  else
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-linux-amd64"
    sha256 "b7086c9885f8d2ba06d13b281b3a5716299a490e493fec4e2f5778384db39339"
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
