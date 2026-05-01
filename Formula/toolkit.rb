class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.7/toolkit-0.1.7-darwin-arm64.tar.gz"
      sha256 "cf6980da373c1f2469a343749b33b88f5aa48f9ec8fd8d91c5ead07af4cfcff1"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.7/toolkit-0.1.7-darwin-amd64.tar.gz"
      sha256 "17995702b5d8a7f84e4b54d2627ed01bbd44751a50e1dbc8ed22f2f9c5f10c9c"
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

        toolkit daemon config edit

      Verify the daemon is running:

        toolkit daemon status

      For Databricks OAuth login, run as _toolkit after daemon setup:

        sudo -u _toolkit env HOME=/var/lib/toolkit tkdbr --conn <name> auth login
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/toolkit --help")
  end
end
