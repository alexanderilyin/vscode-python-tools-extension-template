#!/bin/env bash

set -euxo pipefail

python -m pip install pip-tools
pip-compile --generate-hashes --resolver=backtracking --upgrade ./requirements.in

python -m pip install nox
nox --session setup # 7m24.615s
python -m pip install -r src/test/python_tests/requirements.txt
npm install
npm audit fix

# TODO: nox and VS Code "Testing" panel should use the same python environment
# 2025-01-10 03:34:46.835 [info] > /usr/local/python/current/bin/python -m pytest -p vscode_pytest --collect-only src/test/python_tests --rootdir=.
# 2025-01-10 03:34:46.835 [info] cwd: .
# 2025-01-10 03:34:46.846 [error] /usr/local/python/current/bin/python: No module named pytest
/usr/local/python/current/bin/python -m pip install pytest
# E ModuleNotFoundError: No module named 'hamcrest'
/usr/local/python/current/bin/python -m pip install PyHamcrest
# E ModuleNotFoundError: No module named 'pyls_jsonrpc'
/usr/local/python/current/bin/python -m pip install python-language-server
# E pyls_jsonrpc.exceptions.JsonRpcException: ImportError: libGL.so.1: cannot open shared object file: No such file or directory
sudo apt-get update
sudo apt-get install --yes libgl1-mesa-glx

# UPREV
npm outdated
npm update

# TESTING
npm install --save-dev @vscode/test-cli @vscode/test-electron
