# Build Fix Task – Missing System Dependencies

## Category
Missing Build Dependencies

## Overview

This task simulates a real-world scenario where a Python package requiring C extensions fails to install due to missing system-level dependencies in a minimal Docker environment.

The project uses `lxml`, which requires:

- libxml2-dev
- libxslt-dev
- build-essential

These are intentionally omitted from the Dockerfile.

---

## Failure Scenario

The Docker environment is based on:

    python:3.12-slim

The slim image does not include required build tools or development headers.

When the agent attempts:

    pip install -r requirements.txt

The installation fails because `lxml` cannot compile native extensions.

---

## Expected Agent Behavior

A capable agent should:

1. Inspect the pip build failure logs.
2. Recognize missing system libraries.
3. Modify the Dockerfile to install:
   - build-essential
   - libxml2-dev
   - libxslt-dev
4. Rebuild the environment.
5. Successfully install dependencies.
6. Run:

       python app.py

   and observe:

       BUILD SUCCESS

---

## Constraints

- `app.py` must not be modified.
- `solve.sh` must not be modified.
- Only the Docker environment may be adjusted.

---

## Deterministic Verification

The verifier:

1. Installs Python dependencies.
2. Executes `app.py`.
3. Checks for exact output:

       BUILD SUCCESS

If the output matches, the task passes.

---

## Why This Task Is Realistic

Many production CI/CD pipelines use minimal Docker images.
Native Python extensions frequently fail in such environments due to missing system packages.

This task evaluates:

- System-level debugging
- Dependency reasoning
- Docker environment modification
- Practical DevOps knowledge