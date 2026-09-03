#!/usr/bin/env bats

SCRIPT="${BATS_TEST_DIRNAME}/../../make-docs/python-docs/init-sphinx.sh"

setup() {
  WORK="$(mktemp -d)"
  cd "$WORK"
  mkdir -p src
  printf 'def f():\n    return 1\n' > src/mod.py
}

teardown() {
  rm -rf "$WORK"
}

@test "conf.py gets the current year and a v-stripped version" {
  run bash "$SCRIPT" "My Project" "Jane Doe" "v2.3.4"
  [ "$status" -eq 0 ]
  grep -q "copyright = '$(date +%Y), Jane Doe'" docs/conf.py
  grep -q "version = '2.3.4'" docs/conf.py
  grep -q "release = '2.3.4'" docs/conf.py
}

@test "index.rst underline is exactly the title length" {
  run bash "$SCRIPT" "Proj" "A" "1.0.0"
  [ "$status" -eq 0 ]
  title_len=$(sed -n '1p' docs/index.rst | wc -c)
  rule_len=$(sed -n '2p' docs/index.rst | wc -c)
  [ "$title_len" -eq "$rule_len" ]
}

@test "second run is a no-op when conf.py already exists" {
  bash "$SCRIPT" "Proj" "A" "1.0.0"
  run bash "$SCRIPT" "Other" "B" "9.9.9"
  [ "$status" -eq 0 ]
  grep -q "project = 'Proj'" docs/conf.py
}
