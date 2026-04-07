class Elnora < Formula
  desc "AI-powered bioprotocol optimization CLI for researchers"
  homepage "https://elnora.ai"
  version "1.1.2"
  license "Apache-2.0"

  livecheck do
    url "https://github.com/Elnora-AI/elnora-cli/releases/latest"
    regex(%r{href=.*?/tag/cli-v?(\d+(?:\.\d+)+)["' >]}i)
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/cli-v#{version}/elnora-macos-arm64.tar.gz"
      sha256 "be6c7a2965bdd230428d0a396d8a4ec5b59414212fd73ffb692f378d347f114a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/cli-v#{version}/elnora-macos-x64.tar.gz"
      sha256 "015c3e6f6e7bc89da87404087f35f96d3e8770dd4907cb910416356962acaa11"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/cli-v#{version}/elnora-linux-arm64.tar.gz"
      sha256 "f0f56691a6cb33411cc445a4d8de304420666094e7e38fa9c540f434cebd542b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Elnora-AI/elnora-cli/releases/download/cli-v#{version}/elnora-linux-x64.tar.gz"
      sha256 "a2e23455381ac6880816ea08c6f300e019756bc77dc88ef543520e65638fae72"
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
