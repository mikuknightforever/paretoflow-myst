$ErrorActionPreference = 'Stop'

function Invoke-ParetoMyst {
    param([string[]] $MystArguments)
    $paretoBunCommand = Get-Command bun -ErrorAction SilentlyContinue
    $paretoBun = if ($paretoBunCommand) { $paretoBunCommand.Source } else { Join-Path $env:USERPROFILE '.bun\bin\bun.exe' }
    if (-not (Test-Path -LiteralPath $paretoBun)) { throw 'Bun is required to run MyST on Windows. Install Bun and reopen the terminal.' }
    $paretoCli = Join-Path $env:USERPROFILE '.bun\install\cache\mystmd@1.10.1@@@1\dist\myst.cjs'
    if ($env:PARETO_MYST_CLI) { $paretoCli = $env:PARETO_MYST_CLI }
    # Reuse the pinned CLI when it is already cached locally.
    if (Test-Path -LiteralPath $paretoCli) {
        & $paretoBun $paretoCli @MystArguments
    } else {
        & $paretoBun x --bun mystmd@1.10.1 @MystArguments
    }
    if ($LASTEXITCODE -ne 0) { throw "MyST command failed with exit code $LASTEXITCODE." }
}

function Initialize-ParetoArticleTemplate {
    param([string] $ArticleRoot)
    $paretoTemplate = Join-Path $ArticleRoot '_build\templates\site\myst\article-theme'
    if (-not (Test-Path -LiteralPath (Join-Path $paretoTemplate 'package.json'))) {
        # Download the standard template into the project's relative cache path.
        Push-Location $ArticleRoot
        try {
            Invoke-ParetoMyst -MystArguments @('templates', 'download', '--site', 'article-theme', '_build/templates/site/myst/article-theme')
        } finally {
            Pop-Location
        }
    }
}
