class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.0/toolkit-0.1.0-darwin-arm64.tar.gz"
      sha256 "dc022cb59937a724f9b14c2ed65c50a00f4b21d778c2c57208c7a8007be6ce1e"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.0/toolkit-0.1.0-darwin-amd64.tar.gz"
      sha256 "f726a89306c972012714f58ed025bf1edec19bba9f7960ecd4eec73a2c1aca91"
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
