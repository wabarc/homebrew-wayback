class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.19.1/wayback-darwin-amd64-0.19.1.tar.gz"
    sha256 "2ccbcbb18805315c54765ca0090be9c618e5c3354e70125cb02429a09043603f" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.19.1/wayback-darwin-arm64-0.19.1.tar.gz"
    sha256 "352de3c3f88606b7cde4ff422a5d63a9eaf6459904e959a12e83ab6404096011" # Apple Silicon
  end
  version "0.19.1"
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
