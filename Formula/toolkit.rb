class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.4.0/toolkit-0.4.0-darwin-arm64.tar.gz"
      sha256 "2a1fb2cae97a205c7fba7d4f6c07995d844b5a18fe419395cbeae236123abeb6"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.4.0/toolkit-0.4.0-darwin-amd64.tar.gz"
      sha256 "7a3980d1202a76ff104ba6d957677044c80b1c03ff2c6ca1096619b5bd23a863"
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
