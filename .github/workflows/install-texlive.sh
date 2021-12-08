REMOTE="https://mirrors.ctan.org/systems/texlive/tlnet";
INSTALL="/tmp/install-texlive";

mkdir -p "$INSTALL";
curl -sSL "$REMOTE/install-tl-unx.tar.gz" | tar -xz -C "$INSTALL" \
    --strip-components=1;
"$INSTALL/install-tl" -no-gui -repository $REMOTE \
    -profile .github/workflows/texlive.profile;

export PATH="/tmp/texlive/bin/x86_64-linux:$PATH";

XECJK_PKGS="fontspec xecjk xetex";
CTEX_PKGS="cjk ctex everysel zhnumber";

BIN_PKGS="latexmk l3build";
REQUIRED_PKGS="$XECJK_PKGS $CTEX_PKGS";
FONT_PKGS="fandol";
EXTRA_PKGS="bibunits cite";
DOC_PKGS="booktabs caption hypdoc listings xcolor";

tlmgr install $BIN_PKGS $REQUIRED_PKGS $FONT_PKGS $EXTRA_PKGS $DOC_PKGS;
