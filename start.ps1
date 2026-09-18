param([int] $Port = 3003)
$ErrorActionPreference = 'Stop'
$paretoArticleRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $paretoArticleRoot
. (Join-Path $paretoArticleRoot 'scripts\myst-command.ps1')
Initialize-ParetoArticleTemplate -ArticleRoot $paretoArticleRoot
Invoke-ParetoMyst -MystArguments @('start', '--port', "$Port")
