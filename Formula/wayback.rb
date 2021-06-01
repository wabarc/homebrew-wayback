class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.12.3/wayback-darwin-amd64-0.12.3.tar.gz"
    sha256 "cf3d112a3ea93901c4bc3d60d9f8ce139ffefbb8ee540e60e0a0dc85da95f46a" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.12.3/wayback-darwin-arm64-0.12.3.tar.gz"
    sha256 "d40138b5f25a94b42833386657b799d4e7b930d2406692e114b4a06305bea929" # Apple Silicon
  end
  version "0.12.3"
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
