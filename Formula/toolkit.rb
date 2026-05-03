class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.2.1/toolkit-0.2.1-darwin-arm64.tar.gz"
      sha256 "5a62ef4cf8806656ef1c4bd111d1d253c04b9d98414ab772a27ab093a14a0ecd"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.2.1/toolkit-0.2.1-darwin-amd64.tar.gz"
      sha256 "a5ea940c246b750e261a17e9de362b7cb9667a333f44b46eb2990db4a23243bc"
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
