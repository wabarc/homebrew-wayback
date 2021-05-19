class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.12.0/wayback-darwin-amd64-0.12.0.tar.gz"
    sha256 "d26f181c9b961260a2e73c4b18e9ccb2b125a17a363855c33902ec1c56a0e4c6" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.12.0/wayback-darwin-arm64-0.12.0.tar.gz"
    sha256 "ff1486f9d5569f9ea804fbd39286f1616822552b98a73fbe210d87424e7d5a07" # Apple Silicon
  end
  version "0.12.0"
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
