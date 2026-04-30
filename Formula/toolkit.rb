class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.2/toolkit-0.1.2-darwin-arm64.tar.gz"
      sha256 "6d57ec6792f4bc9676e9cbce71e043c279da4e1946811a0196669945938d4aca"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.2/toolkit-0.1.2-darwin-amd64.tar.gz"
      sha256 "37f04a5d25124f2e51c7ab5df2822c476ed24e7b42592cb169e10d80317e71f7"
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
    system "sudo", "#{opt_libexec}/setup-daemon.sh"
  end

  def caveats
    <<~EOS
      The daemon setup script was run automatically. Add your connections:

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
