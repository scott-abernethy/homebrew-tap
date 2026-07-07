class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.7.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.3/toolkit-0.7.3-darwin-arm64.tar.gz"
      sha256 "71dcf37c6fb791bfb890077df94b931097bd253b30eae03911c56c9447c5e3a9"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.3/toolkit-0.7.3-darwin-amd64.tar.gz"
      sha256 "a6dc5419c49c52817cdaf51130c3e6403c9eded58b2fbb2709320a03625cdb50"
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
