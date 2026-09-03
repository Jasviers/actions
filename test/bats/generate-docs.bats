#!/usr/bin/env bats

SCRIPT="${BATS_TEST_DIRNAME}/../../make-docs/python-docs/generate-docs.sh"

setup() {
  WORK="$(mktemp -d)"
  BIN="$WORK/bin"
  mkdir -p "$BIN" "$WORK/src" "$WORK/docs"
  printf 'x = 1\n' > "$WORK/src/a.py"
  cat > "$BIN/sphinx-apidoc" <<'EOF'
#!/bin/bash
echo "apidoc $*"
EOF
  cat > "$BIN/sphinx-build" <<'EOF'
#!/bin/bash
echo "build $*" > "$SPHINX_LOG"
mkdir -p docs/_build/html
EOF
  chmod +x "$BIN/sphinx-apidoc" "$BIN/sphinx-build"
  export SPHINX_LOG="$WORK/sphinx.log"
  export PATH="$BIN:$PATH"
  cd "$WORK"
}

teardown() {
  rm -rf "$WORK"
}

@test "strict by default: sphinx-build is called with -W" {
  run bash "$SCRIPT"
  [ "$status" -eq 0 ]
  grep -q -- "-W" "$SPHINX_LOG"
}

@test "STRICT_DOCS=false: sphinx-build is called without -W" {
  export STRICT_DOCS=false
  run bash "$SCRIPT"
  [ "$status" -eq 0 ]
  ! grep -q -- "-W" "$SPHINX_LOG"
}

@test ".nojekyll is written into the html output" {
  run bash "$SCRIPT"
  [ "$status" -eq 0 ]
  [ -f docs/_build/html/.nojekyll ]
}
