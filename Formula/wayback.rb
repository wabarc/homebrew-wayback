class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.16.0/wayback-darwin-amd64-0.16.0.tar.gz"
    sha256 "50fed646d75329e0037ca84052b9a0870eb1bc950576029f2935bd045d5f7dad" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.16.0/wayback-darwin-arm64-0.16.0.tar.gz"
    sha256 "929c12c5d576a4fec7a3ef24fa8c1ccd8df6414139d77f97a234907f044e8a84" # Apple Silicon
  end
  version "0.16.0"
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
