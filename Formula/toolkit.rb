class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.2.3/toolkit-0.2.3-darwin-arm64.tar.gz"
      sha256 "cfef1e580335cd35597675f79eed1e086da1258cb861363010d1d9ba7430d0e2"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.2.3/toolkit-0.2.3-darwin-amd64.tar.gz"
      sha256 "dc3320f5f6761916eb8cf035b72848acacb09b7eb3f9f793c7cb8d980dbd69cd"
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
