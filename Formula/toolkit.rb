class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.6/toolkit-0.1.6-darwin-arm64.tar.gz"
      sha256 "08a141d428036c9a3cbc135a9222c12ee51acf1863d70a9f7b3425607972718b"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.6/toolkit-0.1.6-darwin-amd64.tar.gz"
      sha256 "605af754b821d01440e57bcb444dd43872174ef9e593be6d6e5b0142c46f24f3"
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
