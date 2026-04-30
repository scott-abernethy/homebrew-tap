class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.1/toolkit-0.1.1-darwin-arm64.tar.gz"
      sha256 "99dcb443e9d57aa1129f7d5282a312bb8a7217942c5427bdcce9179a608d38bd"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.1/toolkit-0.1.1-darwin-amd64.tar.gz"
      sha256 "cf0ee6607ee121a7650a9d7f55a71bbd90d886ffdb0a9857833e29ac6b82d38c"
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
      To set up the daemon (creates _toolkit system user, installs LaunchDaemon):

        sudo #{opt_libexec}/setup-daemon.sh

      Then add your connections to the daemon config:

        toolkit daemon config edit

      Verify the daemon is running:

        toolkit daemon status

      After `brew upgrade toolkit`, re-run the setup script to update the daemon binary:

        sudo #{opt_libexec}/setup-daemon.sh

      For Databricks OAuth login, run as _toolkit after daemon setup:

        sudo -u _toolkit env HOME=/var/lib/toolkit toolkit dbr login --conn <name>
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/toolkit --help")
  end
end
