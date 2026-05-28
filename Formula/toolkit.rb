class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.6.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.3/toolkit-0.6.3-darwin-arm64.tar.gz"
      sha256 "6d5b92610159b7c12638a9aa4721885057493dd2af3f0a11ebd0dae40199179f"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.3/toolkit-0.6.3-darwin-amd64.tar.gz"
      sha256 "bc0ea4ca8b17780204a1619a62c9d457cafd6911b86903b16078f6364ec661e3"
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
      ⚠️  Complete daemon setup by running (requires sudo):

        sudo #{opt_libexec}/setup-daemon.sh

      This is required after both fresh installs and upgrades.
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/toolkit --help")
  end
end
