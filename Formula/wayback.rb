class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.21.1/wayback-darwin-amd64-0.21.1.tar.gz"
    sha256 "de2b520a8c52cd0cfbdc72700d187b971195a477ee78263d9dfcae415b4ebbd0" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.21.1/wayback-darwin-arm64-0.21.1.tar.gz"
    sha256 "5d94bcf476a95fade92bc9917482d06f6c2b260fbfbd2adef775d116aa107e0b" # Apple Silicon
  end
  version "0.21.1"
  license "GPL-3.0"

  def install
    if Hardware::CPU.intel?
      bin.install "wayback-darwin-amd64" => "wayback"
    else
      bin.install "wayback-darwin-arm64" => "wayback"
    end
  end

  livecheck do
    url "https://api.github.com/repos/wabarc/wayback/releases/latest"
    regex(/"tag_name": "v?(\d+(?:\.\d+)+)"/m)
  end

  test do
    system "false"
  end
end
