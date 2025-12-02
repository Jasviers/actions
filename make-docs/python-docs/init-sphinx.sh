#!/bin/bash
set -e

PROJECT_NAME="${1:-MyProject}"
AUTHOR="${2:-Author}"
VERSION="${3:-1.0.0}"

echo "🔧 Initializing Sphinx configuration..."

# Create docs directory if it doesn't exist
mkdir -p docs

# Check if conf.py already exists
if [ -f docs/conf.py ]; then
    echo "✅ Sphinx configuration already exists in docs/conf.py"
    exit 0
fi

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

echo "📁 Python source directory: $SRC_DIR"

# Create conf.py
cat > docs/conf.py << EOF
# Configuration file for the Sphinx documentation builder.
import os
import sys

# Add source directory to path for autodoc
sys.path.insert(0, os.path.abspath('../${SRC_DIR}'))

# -- Project information -----------------------------------------------------
project = '${PROJECT_NAME}'
copyright = '2024, ${AUTHOR}'
author = '${AUTHOR}'
version = '${VERSION}'
release = '${VERSION}'

# -- General configuration ---------------------------------------------------
extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.viewcode',
    'sphinx.ext.napoleon',
    'sphinx.ext.intersphinx',
    'sphinx.ext.todo',
]

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# -- Options for HTML output -------------------------------------------------
html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']

# -- Extension configuration -------------------------------------------------
autodoc_default_options = {
    'members': True,
    'member-order': 'bysource',
    'special-members': '__init__',
    'undoc-members': True,
    'exclude-members': '__weakref__'
}

# Napoleon settings for Google/NumPy style docstrings
napoleon_google_docstring = True
napoleon_numpy_docstring = True

# Intersphinx mapping
intersphinx_mapping = {
    'python': ('https://docs.python.org/3', None),
}
EOF

# Create index.rst
cat > docs/index.rst << EOF
Welcome to ${PROJECT_NAME}'s documentation!
$( printf '=%.0s' $(seq 1 $((${#PROJECT_NAME} + 26))) )

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   modules

Indices and tables
==================

* :ref:\`genindex\`
* :ref:\`modindex\`
* :ref:\`search\`
EOF

# Create _static and _templates directories
mkdir -p docs/_static docs/_templates

# Create .nojekyll for GitHub Pages
touch docs/_static/.gitkeep
touch docs/_templates/.gitkeep

echo "✅ Sphinx configuration created successfully!"
