class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.3/toolkit-0.0.3-darwin-arm64.tar.gz"
      sha256 "e877756765b31d84624e8f43ca058d7e479698827698a379d58cac36f7b1bc15"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.3/toolkit-0.0.3-darwin-amd64.tar.gz"
      sha256 "4b49ca44e318053a6cd67cfdcf999023cb311c56ccbce852bc07192bf811812f"
    end
  end

  def install
    bin.install "toolkit"
    bin.install "tkpsql"
    bin.install "tkmsql"
    bin.install "tkdbr"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/toolkit --help")
  end
end
