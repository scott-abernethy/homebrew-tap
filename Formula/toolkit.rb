class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.7.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.2/toolkit-0.7.2-darwin-arm64.tar.gz"
      sha256 "ecfef7c35cf4081801dbfd7c9cc62aacce0ffd9a8e350b93a22b05678442cceb"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.2/toolkit-0.7.2-darwin-amd64.tar.gz"
      sha256 "896da7e4cfc1e4a9efff37af97394632053029fbe66bb9fdc2d66b34fb6dd346"
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
