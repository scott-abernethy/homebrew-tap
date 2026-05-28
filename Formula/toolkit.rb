class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.6.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.2/toolkit-0.6.2-darwin-arm64.tar.gz"
      sha256 "3fbb249fe17b881d0df751d0ee43a8e2c5508e16846e94577e803b5cd11add58"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.6.2/toolkit-0.6.2-darwin-amd64.tar.gz"
      sha256 "a2427d043b7bec22d48a4949a014423a43da9ca0a09b368e48817640c5967ef3"
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
      ⚠️  Complete daemon setup by running (requires sudo):

        sudo #{opt_libexec}/setup-daemon.sh

      This is required after both fresh installs and upgrades.
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/toolkit --help")
  end
end
