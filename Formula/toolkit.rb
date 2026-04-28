class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.7/toolkit-0.0.7-darwin-arm64.tar.gz"
      sha256 "8dd00a8cfd56482a1fbd9745e508d061e1e1792acc7f5ed5866d2eb0c0fe7d86"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.7/toolkit-0.0.7-darwin-amd64.tar.gz"
      sha256 "2ec9091942496c4c08fa57902b39c4c1c7addc1adc51d51aaabc494ffc5b427c"
    end
  end

  def install
    bin.install "toolkit"
    bin.install "tkpsql"
    bin.install "tkmsql"
    bin.install "tkdbr"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/toolkit --help")
  end
end
