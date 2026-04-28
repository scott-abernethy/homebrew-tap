class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.6/toolkit-0.0.6-darwin-arm64.tar.gz"
      sha256 "709acf9ee5ee4da33d4fa13403771f681d2b844fc22d4e496f04c2a0bc568be5"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.6/toolkit-0.0.6-darwin-amd64.tar.gz"
      sha256 "8273ef854751dfb927839e43d5c0909492b95a10cf9119c86cf9e3bbef04f383"
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
