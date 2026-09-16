class Lumos < Formula
  desc "Lumos command-line tool"
  homepage "https://github.com/danpihl/LumosTool"
  version "1.0.0"

  url "https://github.com/danpihl/LumosTool/releases/download/v1.0.0/lumos-macos-1.0.0.tar.gz"
  sha256 "48d1ed01a9af91b381cec8b1b10530024fe7a4d5adfe793fcd687bb58f01e96d"
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
