class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.2/toolkit-0.0.2-darwin-arm64.tar.gz"
      sha256 "f2c08db14b590cdb8d68c958f1a3d55e431b572f3d8dc42b1624e7dd5dbf2e0c"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.2/toolkit-0.0.2-darwin-amd64.tar.gz"
      sha256 "8b11d3ea49a0cd6078dbae007998f85423e2d65843ba16edf40c04226ecc160a"
    end
  end

  def install
    bin.install "bin/toolkit"
    bin.install "bin/tkpsql"
    bin.install "bin/tkmsql"
    bin.install "bin/tkdbr"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/toolkit --help")
  end
end
