class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.5/toolkit-0.1.5-darwin-arm64.tar.gz"
      sha256 "eb632662402f3558248abba1fe6cf942b601aae4014f8a075b09e4353a14e47e"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.5/toolkit-0.1.5-darwin-amd64.tar.gz"
      sha256 "c2757cbee553eedf3c0067b836d3c910bb2018a95574ebb811c6c905a91d71c9"
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
