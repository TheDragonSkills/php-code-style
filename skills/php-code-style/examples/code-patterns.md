# Code Patterns

These independent PHP snippets demonstrate formatting decisions. They are not a
single program. Confirm runtime support before using pipe syntax or the optional
clone properties argument; no minimum PHP version is inferred here.

## Clone Calls

Prefer `clone($prototype)` over `clone $prototype`. When property overrides are
already part of the operation, keep them inside the same argument list.

```php
<?php

$replica = clone($prototype);
$configured = clone($prototype, [
    'label' => 'Preview',
]);
```

## Switch Cases

The first label is empty and shares the next body. Both non-empty cases end
explicitly. Their bodies have no extra braces, and the multiline condition ends
with a line containing only `):`.

```php
<?php

switch (true) {
    case $isAdministrator:
    case (
        $hasInvitation
        && $isActive
    ):
        $access = 'granted';
        break;
    case $isSuspended:
        $access = 'denied';
        break;
}
```

If an existing non-empty case intentionally falls through, report the conflict
before inserting `break`; that insertion changes which statements execute.

## Pipe Spacing

Separate every inline pipe operator from both operands.

```php
<?php

$length = $text |> trim(...) |> strlen(...);
```

## Multiline Pipe Placement

Move pipe operators to the start of indented continuation lines when wrapping.

```php
<?php

$length = $text
    |> trim(...)
    |> strlen(...);
```

## Empty Closures

Collapse an empty multiline body to `{}`. For this untyped no-op callback, an
arrow returning `null` is the preferred alternative.

```php
<?php

$onIdle = function () {};
$onIdle = fn() => null;
```

These are alternatives. Do not retain both assignments in application code or
remove a declared signature merely to fit the arrow example.

## Attributes on Anonymous Classes

`new` ends its line. Attributes begin one indentation level deeper, and `class`
starts on a new line aligned with them. `DisplayName` represents an attribute
defined by the application.

```php
<?php

$view = new
    #[DisplayName('summary')]
    class {
        public string $title = 'Summary';
    };
```

## Enum Visibility

For a non-public enum constant, replace `protected` with `private`. The method
below demonstrates the same existing restriction for non-public enum methods.

```php
<?php

enum DeliveryMode
{
    case Standard;
    case Express;

    private const FALLBACK = self::Standard;

    private static function fallback(): self
    {
        return self::FALLBACK;
    }
}
```

## Multiline Arrays

Attach the opening bracket in every context. The same check covers an assignment,
a return value, and an argument; do not limit it to the first pattern.

```php
<?php

$roles = [
    'reader',
    'editor',
];
```

```php
<?php

return [
    'reader',
    'editor',
];
```

```php
<?php

assignRoles([
    'reader',
    'editor',
]);
```
