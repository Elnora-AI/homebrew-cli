class Elnora < Formula
  desc "AI-powered bioprotocol optimization CLI for researchers"
  homepage "https://elnora.ai"
  version "v1.3.0"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/Elnora-AI/elnora-cli/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-arm64.tar.gz"
      sha256 "33da96e5c4f08be07e7038f4a0aa54b60549a69fb37ccbac7e1461e9f413fe95"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-x64.tar.gz"
      sha256 "992cfa999242413c20979fd5eec3ac665e3b5d0428ed03c2d49ffcf74a9daf1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-arm64.tar.gz"
      sha256 "cf43e611d553f85a3c99e241ca2d385c5a0ec7b6f221c3f1fe51f4a016259eda"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-x64.tar.gz"
      sha256 "d089c82d120971b23f726fbaa284b4fa2341227b34242a2ea6afebfd5034e098"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "elnora-macos-arm64" => "elnora"
    elsif OS.mac?
      bin.install "elnora-macos-x64" => "elnora"
    elsif Hardware::CPU.arm?
      bin.install "elnora-linux-arm64" => "elnora"
    else
      bin.install "elnora-linux-x64" => "elnora"
    end
  end

  def caveats
    <<~EOS
      To get started, run:

        elnora auth login

      You'll need an API key from https://platform.elnora.ai

      Documentation: https://github.com/Elnora-AI/elnora-cli
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elnora --version")
  end
end
