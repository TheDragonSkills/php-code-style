Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$scriptDirectory = Split-Path -Parent $PSCommandPath

Push-Location -LiteralPath $scriptDirectory

codex '$aif-distillation per-coding-style/migration-3.1.md --path skills --redact-source-map --name php-code-style'
