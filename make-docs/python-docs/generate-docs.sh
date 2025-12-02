#!/bin/bash
set -e

echo "📚 Generating Python documentation..."

# Find Python source directory
SRC_DIR=""
for dir in src . lib app; do
    if [ -d "$dir" ] && find "$dir" -name "*.py" -type f | head -1 | grep -q .; then
        SRC_DIR="$dir"
        break
    fi
done

if [ -z "$SRC_DIR" ]; then
    SRC_DIR="."
fi

echo "📁 Scanning Python modules in: $SRC_DIR"

# Generate API documentation using sphinx-apidoc
# Exclude patterns are positional arguments, not flags
if [ "$SRC_DIR" = "." ]; then
    sphinx-apidoc -f -o docs/ . "setup.py" "docs" "tests" "test_*" "venv" ".venv" "build" "dist"
else
    sphinx-apidoc -f -o docs/ "$SRC_DIR"
fi

echo "🔨 Building HTML documentation..."

# Build the documentation
sphinx-build -b html docs/ docs/_build/html -W --keep-going || sphinx-build -b html docs/ docs/_build/html

# Create .nojekyll file for GitHub Pages
touch docs/_build/html/.nojekyll

echo "✅ Documentation generated successfully!"
echo "📂 Output: docs/_build/html"
