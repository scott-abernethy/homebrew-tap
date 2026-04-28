class Toolkit < Formula
  desc "Safety kit between AI coding agents and sensitive services"
  homepage "https://github.com/scott-abernethy/toolkit"
  license "MIT"
  version "0.0.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.5/toolkit-0.0.5-darwin-arm64.tar.gz"
      sha256 "fbfd0fdf2f334765a0bdd0553cca2f4cd186080c5fb974413aab00fe10868126"
    else
      url "https://github.com/scott-abernethy/toolkit/releases/download/v0.0.5/toolkit-0.0.5-darwin-amd64.tar.gz"
      sha256 "3ef7d6eb02d67e9e619cd4a3aa7aefbd5131de77888d90d78e3b94a0f513f64f"
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
