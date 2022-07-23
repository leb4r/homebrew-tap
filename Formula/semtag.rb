class Semtag < Formula
  desc "Tag your repository according to Semantic Versioning"
  homepage "https://github.com/leb4r/semtag"
  url "https://github.com/leb4r/semtag/archive/0.4.0.tar.gz"
  sha256 "44cb3e3ddffbe728c7a46ffe5dd034d2ba0dc12724ece99f5b12d630e5b83adf"
  license "MIT"
  head "https://github.com/leb4r/semtag.git"

  livecheck do
    url "https://github.com/leb4r/semtag/releases"
    regex(%r{href=.*?v?(\d+(?:\.\d+)+)/?["' >]}i)
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-ldflags", "-s -w"

    (bash_completion/"semtag").write `#{bin}/semtag completion bash`
    (zsh_completion/"_semtag").write `#{bin}/semtag completion zsh`
    (fish_completion/"semtag.fish").write `#{bin}/semtag completion fish`
  end

  test do
    system "#{bin}/semtag"
  end
end
