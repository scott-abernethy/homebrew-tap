class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.4.0/toolkit-0.4.0-darwin-arm64.tar.gz"
      sha256 "76e7638e70f0d28d21c9d7c4b983c20140af3f5092928ca7f0f616d20cc499ff"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.4.0/toolkit-0.4.0-darwin-amd64.tar.gz"
      sha256 "12fc55a2d22a7d625c68857e7c6afdcc1224118f1f86620c045515a7447fdb7d"
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
