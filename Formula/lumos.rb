class Lumos < Formula
  desc "Lumos command-line tool"
  homepage "https://github.com/danpihl/LumosTool"
  version "1.0.0"

  url "https://github.com/danpihl/LumosTool/releases/download/v1.0.0/lumos-macos-1.0.0.tar.gz"
  sha256 "91655dfe87fac4970a72d0b1d0eaf96d1b868b1398319e499c2af7182ae2a4f0"
  license "MIT"

  def install
    # Install CLI entrypoint
    bin.install "bin/lumos"

    # Install to share/lumos so the binary can find it via relative path.
    # The release tarball has share/boards and share/toolchains directly
    # (no share/lumos/ nesting) - the lumos binary itself expects
    # {parent_of_bin}/share/lumos/{boards,toolchains}/...
    (share/"lumos").install Dir["share/*"]
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/lumos --version")
  end
end
