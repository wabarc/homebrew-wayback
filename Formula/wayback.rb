class Wayback < Formula
  desc "A toolkit for snapshot webpage to Internet Archive, archive.today, IPFS and beyond"
  homepage "https://github.com/wabarc"
  if Hardware::CPU.intel?
    url "https://github.com/wabarc/wayback/releases/download/v0.16.1/wayback-darwin-amd64-0.16.1.tar.gz"
    sha256 "e7cd560ec068f2d8200dc9c703a0dd67af37ff79bd61fc91a60d7ad2251766dd" # Intel
  else
    url "https://github.com/wabarc/wayback/releases/download/v0.16.1/wayback-darwin-arm64-0.16.1.tar.gz"
    sha256 "7c74e3c523e771cc2cc6be7372358a2d54f7083d183ad8197aaa64bac0ce3f46" # Apple Silicon
  end
  version "0.16.1"
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
