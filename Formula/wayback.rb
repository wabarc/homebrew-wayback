class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.15.1/wayback-darwin-amd64-0.15.1.tar.gz"
    sha256 "50f204935576536014d2ceb806fd498550714766e259a5c9b37785e012f91732" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.15.1/wayback-darwin-arm64-0.15.1.tar.gz"
    sha256 "487d092e045afa54ca3e6617185ef084bc6fa1d24807fac8a8c1ecfbedc60b6b" # Apple Silicon
  end
  version "0.15.1"
  license "GPL-3.0"

  def install
    bin.install "wayback-darwin-amd64" => "wayback"
  end

  livecheck do
    url "https://api.github.com/repos/wabarc/wayback/releases/latest"
    regex(/"tag_name": "v?(\d+(?:\.\d+)+)"/m)
  end

  test do
    system "false"
  end
end
