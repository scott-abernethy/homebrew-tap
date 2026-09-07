class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.7.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.5/toolkit-0.7.5-darwin-arm64.tar.gz"
      sha256 "5c5f9628f6664f14e74d896e04e034986ede1f69c3cdbfcff16b97cf738ef996"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.5/toolkit-0.7.5-darwin-amd64.tar.gz"
      sha256 "6cc491ebaf16e6a098b10901ae160b1725d57b7012ac604f3fe0ad8fa8db6701"
    end
  end

  def install
    bin.install "toolkit"
    bin.install "tkpsql"
    bin.install "tkmsql"
    bin.install "tkdbr"
    bin.install "toolkit-daemon"
    libexec.install "libexec/setup-daemon.sh"
  end

  def caveats
    <<~EOS
      Complete daemon setup by running:

        toolkit setup

      This is required after both fresh installs and upgrades.
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/toolkit --help")
  end
end
