class Gader < Formula
  desc "Store your transactions as YAML and generate [ledger-cli](https://ledger-cli.org) compliant files which can be used for further accounting."
  homepage "https://github.com/leb4r/gader"
  url "https://github.com/leb4r/gader/archive/v0.0.1.tar.gz"
  sha256 "ef8d8aa15a6daf493da5c039a14fd78791519527f2acf16b0457a6bc40ae41d6"
  license "MIT"
  head "https://github.com/leb4r/gader.git"

  livecheck do
    url "https://github.com/leb4r/gader/releases"
    regex(%r{href=.*?v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-s -w"

    (bash_completion/"gader").write `#{bin}/gader completion bash`
    (zsh_completion/"_gader").write `#{bin}/gader completion zsh`
    (fish_completion/"gader.fish").write `#{bin}/gader completion fish`
  end

  test do
    system "#{bin}/gader"
  end
end
