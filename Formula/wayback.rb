class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.13.1/wayback-darwin-amd64-0.13.1.tar.gz"
    sha256 "6d05af8ce115744c98aeccf459e99ba686059ab9bba74481f4ee135a05332a53" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.13.1/wayback-darwin-arm64-0.13.1.tar.gz"
    sha256 "b6323adc5c8fe064a612d21470244c4f08cfc84e8417bdb1ad8bf59969238659" # Apple Silicon
  end
  version "0.13.1"
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
