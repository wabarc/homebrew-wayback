class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.17.0/wayback-darwin-amd64-0.17.0.tar.gz"
    sha256 "3277a1d9d857edef92a4525f1997407de1752613f9b59a68af33da7a22a2e364" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.17.0/wayback-darwin-arm64-0.17.0.tar.gz"
    sha256 "180be82b5f6633f611d4f55012429b9d6fc0691859664a02a66314186a4e8041" # Apple Silicon
  end
  version "0.17.0"
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
