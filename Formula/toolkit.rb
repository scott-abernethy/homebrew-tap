class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.2.2/toolkit-0.2.2-darwin-arm64.tar.gz"
      sha256 "524a9819200339be46e93a6be25c814ae45e540408c3e8e4c9efc692eafcfe51"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.2.2/toolkit-0.2.2-darwin-amd64.tar.gz"
      sha256 "50950ee51dc150c4720cb4b57c51f568c8506f56c99cbf0ac14e0956abffa91a"
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

  def post_install
    opoo "Run the following to complete daemon setup:"
    opoo "  sudo #{opt_libexec}/setup-daemon.sh"
  end

  def caveats
    <<~EOS
      Complete daemon setup by running (requires sudo):

        sudo #{opt_libexec}/setup-daemon.sh

      This is required after both fresh installs and upgrades.

      Then add your connections:

        toolkit config edit

      Verify the daemon is running:

        toolkit status

      For Databricks OAuth login, run as _toolkit after daemon setup:

        sudo -u _toolkit env HOME=/var/lib/toolkit tkdbr --conn <name> auth login
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/toolkit --help")
  end
end
