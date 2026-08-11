class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.7.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.4/toolkit-0.7.4-darwin-arm64.tar.gz"
      sha256 "67158be8c2bc7c90f0f1c1d01553c9b8802c7ffbc82c9d0b35a0b7f0457eaa92"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.4/toolkit-0.7.4-darwin-amd64.tar.gz"
      sha256 "aabb9ae6b916187ef3b96c06bb5f0e78cac851b34fc8c6c79e253c17ac6a8a7f"
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
