class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.0/toolkit-0.6.0-darwin-arm64.tar.gz"
      sha256 "dacc08248bde280345e5e1f6e76a1f2b28ba7c009441ec29b2909f09ce021df7"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.0/toolkit-0.6.0-darwin-amd64.tar.gz"
      sha256 "eb134bd5e2878fd094f3e1ac71873fef7bce91e5ade7a756688fc8f0ae6967a8"
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
