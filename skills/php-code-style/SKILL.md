---
name: php-code-style
description: >-
  Apply and review PHP formatting changes for PER-CS 3.1: clone calls, switch
  cases, pipe operators, empty closures, attributed anonymous classes, enum
  visibility, and multiline arrays. Use for targeted style migrations, code
  generation, or reviews involving these constructs.
argument-hint: "<PHP files or diff> [review|apply]"
---

# PHP Code Style

Use this skill to produce a small formatting patch or actionable review findings
for the constructs listed above. Its coverage is limited to migration changes
from 3.0 to 3.1. The distilled guidance is non-normative; full-standard
conformance is outside this skill's coverage.

## Workflow

1. Identify the requested files or diff and whether the user wants review or
   edits. Read applicable project instructions, PHP compatibility constraints,
   and existing formatter configuration. Keep review-only requests read-only.
2. Read [formatting rules](references/RULES.md). Check each applicable construct;
   preserve the distinction between required rules and recommendations.
3. Use [code patterns](examples/code-patterns.md) to make the smallest relevant
   changes. Preserve behavior. Investigate case fall-through before adding a
   terminator; preserve closure signatures and contracts when considering arrows.
4. Use the project's existing formatter check and PHP syntax check when
   available. Verify that the checker supports the syntax being checked. Report
   unavailable checks and unsupported syntax without claiming they passed.
5. Inspect the diff for unrelated edits and behavior changes. Report the files
   changed or findings as `file:line — required/recommended — issue — correction`,
   followed by checks run and unresolved items. Limit any clean result to the
   covered constructs and inspected files.

## Boundaries

- Apply only the included rules. Use project instructions for unspecified style.
- Preserve supported syntax; this skill does not require introducing pipe chains
  or the optional clone properties argument into existing code.
- Empty case labels can share a following body. A non-empty case still needs a
  terminating statement, including the final case.
- Treat a blocked behavior-sensitive change as a finding until its intended
  behavior is established.

## Artifact Ownership and Config Policy

- Read the selected PHP files and their governing instructions, runtime
  constraints, and formatter configuration.
- In edit mode, write only PHP files within the requested scope. Produce review
  findings in the response; create a report file only when requested.
- Keep configuration, dependencies, and unrelated project artifacts read-only.
  No AI Factory configuration or generated tracking artifacts are required.
