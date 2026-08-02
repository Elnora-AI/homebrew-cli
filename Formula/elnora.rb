class Elnora < Formula
  desc "AI-powered bioprotocol optimization CLI for researchers"
  homepage "https://elnora.ai"
  version "2.6.3"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-arm64.tar.gz"
      sha256 "cbc5a7f495b05c3bbdf80e00e4a493b8a4d1318bf3977a8f6a9f1a6d490ece33"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-macos-x64.tar.gz"
      sha256 "71186be20b068c3d72a9d4a64a32d209a5406d8cb0e2b81089f5a8c51eda794c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-arm64.tar.gz"
      sha256 "754861afa028705785bd36dc16af92882c156a9dcc5cd0b68ab7ac2e53a79057"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/v#{version}/elnora-linux-x64.tar.gz"
      sha256 "25543673dd865b367fa75d1a915dd8aba03238a373fe7d57c00d8e5f0e09a2f1"
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
      To get started:

        elnora auth login
        elnora setup          # Configure Claude Code, Cursor, etc.

      You'll need an API key from https://platform.elnora.ai
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/elnora --version")
  end
end
