class Aipack < Formula
  desc "Portable AI agent configuration pack manager"
  homepage "https://github.com/shrug-labs/aipack"
  version "0.32.0"
  license "UPL-1.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-arm64"
    sha256 "eeeab16755b2d4acd7d680756869d724b2eef050501fe479835e3164fb61d433"
  elsif OS.mac?
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-darwin-amd64"
    sha256 "4e964924fbe1fe5cceff15370c1323e5583037c0a26f217a8d51cbb12d25e4a2"
  else
    url "https://github.com/shrug-labs/aipack/releases/download/v#{version}/aipack-linux-amd64"
    sha256 "87cdd5ef639b91891f241168c45e6b91c664ab3c8d5d6772977ec186c3e251fd"
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
