class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.13.0/wayback-darwin-amd64-0.13.0.tar.gz"
    sha256 "fd11e380071d9bab5b2168b97afb81ea432f7bc92dbdbc8d29d05b282b3ea0cf" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.13.0/wayback-darwin-arm64-0.13.0.tar.gz"
    sha256 "8c40e29063d301a21c42f7b5629d0c00822f01416d644e74c82d3a74b9584a1e" # Apple Silicon
  end
  version "0.13.0"
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
