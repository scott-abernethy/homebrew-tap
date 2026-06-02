class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.0/toolkit-0.7.0-darwin-arm64.tar.gz"
      sha256 "f41e42c583eec230e0ef710a0b501bff97fafa1e5220a10d68300a82e46712e9"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.0/toolkit-0.7.0-darwin-amd64.tar.gz"
      sha256 "7325a40ac3fb5297e01fb1ac69393b4e21c4475411bc2c689eb71c5877e421be"
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
