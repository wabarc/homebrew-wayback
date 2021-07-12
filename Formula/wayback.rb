class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.14.1/wayback-darwin-amd64-0.14.1.tar.gz"
    sha256 "c229fd2427dabe924524d50bee104955529b59b8136cf10d4d62bd25046410e4" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.14.1/wayback-darwin-arm64-0.14.1.tar.gz"
    sha256 "ffdb2491e08eff2da9807c3585686c03721b1976b208621e4a1baa562be14797" # Apple Silicon
  end
  version "0.14.1"
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
