class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.1/toolkit-0.7.1-darwin-arm64.tar.gz"
      sha256 "3dbbfad9b003e6ba179be011b236c5ffb214e7218ec8ca20c0c7a19d9977b3e3"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.7.1/toolkit-0.7.1-darwin-amd64.tar.gz"
      sha256 "e78feb80b1e6dd48923f5a1c9753ff5af1d66d26532576ed6e8a9e667a063575"
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
