# Formatting Rules

Use this checklist with the [code patterns](../examples/code-patterns.md).
Required and recommended below retain the strength of the distilled migration
guidance. Recommendations allow a justified exception; do not report them as
mandatory violations.

## Clone Calls

**Recommended:** call `clone` with parentheses around its arguments, including
when the optional `$withProperties` argument is absent. Apply the same form when
that argument is already used. Do not add property overrides as a formatting fix.

## Switch Cases

**Required:**

- Leave case bodies directly under their labels; do not enclose a case body in
  an extra pair of braces. This does not prohibit braces for nested statements.
- End every non-empty case with `break`, `return`, or another terminating
  statement, including the final case in the switch.
- Enclose a multiline case condition in parentheses. Put the opening `(` on the
  `case` line and put `):` alone on the final line of the condition.

An empty label sharing the next case's body does not need its own terminator.
Before inserting a terminator into a non-empty case, establish whether the code
relies on fall-through. If it does, report the required control-flow change for
resolution; a formatting pass must preserve behavior.

## Pipe Spacing

**Required:** place at least one space on both sides of `|>` in an inline pipe
chain. Check every operator in the chain.

## Multiline Pipe Placement

**Required:** when a pipe chain spans lines, start each continuation line with
`|>` after indentation. Indent every continuation line relative to the first
line. Keep a space after the operator; do not add trailing whitespace to the
previous line to imitate inline spacing.

## Empty Closures

**Required:** a closure with no statements uses `{}` on the same line as the
preceding symbol, with one separating space.

**Recommended:** use an arrow function for an empty closure where possible.
Check the closure's signature and behavior before replacing it. When a compatible
arrow form is unavailable, retain the closure with its compact empty body.

## Attributes on Anonymous Classes

**Required:** begin attributes on the line after `new`, indented one level.
After the last attribute, begin the remaining anonymous class declaration on a
new line at the same indentation as the attributes.

Other attribute rules are outside the included guidance. Preserve established
project conventions for their internal formatting.

## Enum Visibility

**Required:** use `private` for non-public enum constants, extending the same
restriction already applied to enum methods. Keep public members public; this
rule does not require reducing their visibility.

## Multiline Arrays

**Required:** keep the opening `[` attached to the surrounding expression; it
must not occupy a line by itself. Check all contexts, including assignments,
returns, and function arguments.
