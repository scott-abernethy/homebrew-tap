class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.6.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.4/toolkit-0.6.4-darwin-arm64.tar.gz"
      sha256 "b1f5933d7dfb4f61c3a53143c688ff14538047e57514b37ef28f3c13de648e6d"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.4/toolkit-0.6.4-darwin-amd64.tar.gz"
      sha256 "aa44153b36f569e926504f85c836a4d109569abb8ef1e82c1f801b12f0e00d2d"
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
