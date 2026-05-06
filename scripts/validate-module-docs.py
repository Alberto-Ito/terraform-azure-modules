#!/usr/bin/env python3
"""Validate baseline documentation coverage for Terraform modules."""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

BLOCK_START = re.compile(r'^\s*(variable|output)\s+"([^"]+)"\s*\{')
DESCRIPTION = re.compile(r'^\s*description\s*=')
README_NAMES = ("README.md", "readme.md")


def iter_module_dirs(root: Path) -> list[Path]:
    if not root.exists():
        return []
    return sorted(path for path in root.iterdir() if path.is_dir() and any(path.glob("*.tf")))


def iter_tf_blocks(path: Path) -> list[tuple[str, str, int, list[str]]]:
    blocks: list[tuple[str, str, int, list[str]]] = []
    lines = path.read_text(encoding="utf-8").splitlines()
    index = 0
    while index < len(lines):
        match = BLOCK_START.match(lines[index])
        if not match:
            index += 1
            continue

        kind, name = match.groups()
        start_line = index + 1
        depth = lines[index].count("{") - lines[index].count("}")
        block_lines = [lines[index]]
        index += 1

        while index < len(lines) and depth > 0:
            block_lines.append(lines[index])
            depth += lines[index].count("{") - lines[index].count("}")
            index += 1

        blocks.append((kind, name, start_line, block_lines))

    return blocks


def validate_module(module_dir: Path) -> list[str]:
    errors: list[str] = []
    if not any((module_dir / name).is_file() for name in README_NAMES):
        errors.append(f"{module_dir}: missing README.md")

    for tf_file in sorted(module_dir.glob("*.tf")):
        for kind, name, line, block_lines in iter_tf_blocks(tf_file):
            if not any(DESCRIPTION.match(block_line) for block_line in block_lines):
                errors.append(
                    f"{tf_file}:{line}: {kind} \"{name}\" is missing a description"
                )

    return errors


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Validate that Terraform modules include a README and descriptions for variables/outputs."
    )
    parser.add_argument(
        "roots",
        nargs="*",
        default=["modules"],
        help="Module root directories to validate (default: modules).",
    )
    args = parser.parse_args()

    errors: list[str] = []
    module_count = 0
    for root in args.roots:
        module_dirs = iter_module_dirs(Path(root))
        module_count += len(module_dirs)
        for module_dir in module_dirs:
            errors.extend(validate_module(module_dir))

    if errors:
        print("Module documentation validation failed:", file=sys.stderr)
        for error in errors:
            print(f"- {error}", file=sys.stderr)
        return 1

    print(f"Module documentation validation passed for {module_count} module(s).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
