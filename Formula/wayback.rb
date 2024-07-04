class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/archive/refs/tags/v0.20.1.tar.gz"
    sha256 "b65833d8aa5c19ab8971c0b97bd96bdda235a6e420259aabe0daa5adf098d972" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.19.1/wayback-darwin-arm64-0.19.1.tar.gz"
    sha256 "352de3c3f88606b7cde4ff422a5d63a9eaf6459904e959a12e83ab6404096011" # Apple Silicon
  end
  version "0.19.1"
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
