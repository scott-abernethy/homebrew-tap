class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.1/toolkit-0.6.1-darwin-arm64.tar.gz"
      sha256 "f39971f26491109dc14b69d30e07f499d355bb3d0a8e486522c1733b1cb9691e"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.1/toolkit-0.6.1-darwin-amd64.tar.gz"
      sha256 "701f859122a6bb41694ee5e14b273372ed339ade0f01276c4681d8ae63ac6938"
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
