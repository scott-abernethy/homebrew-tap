class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.3.1/toolkit-0.3.1-darwin-arm64.tar.gz"
      sha256 "2a2d8cf105794e248f927c3843c94252fb1b343004970f01926beeb4edcbeef2"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.3.1/toolkit-0.3.1-darwin-amd64.tar.gz"
      sha256 "09b5c17f472d0a98002edd7f7d36001a4a9d67879286354f72f7c5022cd0bd8a"
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
