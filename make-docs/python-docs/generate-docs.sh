#!/bin/bash
set -euo pipefail

echo "📚 Generating Python documentation..."

# Find Python source directory
SRC_DIR=""
for dir in src . lib app; do
    if [ -d "$dir" ] && [ -n "$(find "$dir" -name '*.py' -type f -print -quit)" ]; then
        SRC_DIR="$dir"
        break
    fi
done

if [ -z "$SRC_DIR" ]; then
    SRC_DIR="."
fi

echo "📁 Scanning Python modules in: $SRC_DIR"

# Generate API documentation using sphinx-apidoc
if [ "$SRC_DIR" = "." ]; then
    sphinx-apidoc -f -o docs/ . "setup.py" "docs" "tests" "test_*" "venv" ".venv" "build" "dist"
else
    sphinx-apidoc -f -o docs/ "$SRC_DIR"
fi

echo "🔨 Building HTML documentation..."

sphinx_opts=(--keep-going)
if [ "${STRICT_DOCS:-true}" = "true" ]; then
    sphinx_opts=(-W "${sphinx_opts[@]}")
fi
sphinx-build -b html docs/ docs/_build/html "${sphinx_opts[@]}"

touch docs/_build/html/.nojekyll

echo "📂 Generated documentation files:"
ls -la docs/_build/html/

echo "✅ Documentation generated successfully!"
echo "📂 Output: docs/_build/html"
