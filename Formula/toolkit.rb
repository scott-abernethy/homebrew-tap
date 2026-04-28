class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.4/toolkit-0.0.4-darwin-arm64.tar.gz"
      sha256 "4010330c4647a0018a95a42805c140d9f90dad01e27cdbfe42f366fde8c1aef2"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.4/toolkit-0.0.4-darwin-amd64.tar.gz"
      sha256 "79211cc6179e7c0ed09b28705a21aa6cd33cc68312335ab109bc294973c03843"
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
