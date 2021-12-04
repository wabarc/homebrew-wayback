class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.16.2/wayback-darwin-amd64-0.16.2.tar.gz"
    sha256 "6db841523aca6e952419e1bb6ad15e45ec0541766896c8d0958f1759ddbeb097" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.16.2/wayback-darwin-arm64-0.16.2.tar.gz"
    sha256 "9f04dc4a739546a1b1ea5500a3e5eed71eceb4b0fcc8da0ec14496944da65ed3" # Apple Silicon
  end
  version "0.16.2"
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
