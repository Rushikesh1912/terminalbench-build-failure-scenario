## Task: Fix Missing Build Dependencies

The Python project inside the `project/` directory fails during installation.

The package `lxml` requires system-level build dependencies that are not installed in the current Docker environment.

Your task:

1. Fix the environment so that `pip install -r requirements.txt` succeeds.
2. Ensure running:

   python app.py

   prints:

   BUILD SUCCESS

Constraints:
- Do not modify `app.py`.
- Do not modify `solve.sh`.
- Only modify the environment configuration.