class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.5.0/toolkit-0.5.0-darwin-arm64.tar.gz"
      sha256 "e1f5c9e6e67341dd8f83fed9bea875875009ef9835b18c0636df78e88b94c7c4"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.5.0/toolkit-0.5.0-darwin-amd64.tar.gz"
      sha256 "c36f1605a5927feebe26c29b53ac0e4abdd1b6ca8d7756e161922bbaaf017e70"
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
