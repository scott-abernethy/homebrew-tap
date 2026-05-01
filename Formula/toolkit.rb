class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.4/toolkit-0.1.4-darwin-arm64.tar.gz"
      sha256 "ba5cdac4eca885fe84fcdc89dcc281f5fb21fd8b7137f0f8354e60b34a1df959"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.1.4/toolkit-0.1.4-darwin-amd64.tar.gz"
      sha256 "ac22483f2d6e5577ec22c6deab55f3e44e94bda3eefe8543af7a84ca96178cf1"
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
