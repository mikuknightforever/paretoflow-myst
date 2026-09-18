param([switch] $SiteOnly)
$ErrorActionPreference = 'Stop'
$paretoArticleRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $paretoArticleRoot
. (Join-Path $paretoArticleRoot 'scripts\myst-command.ps1')
Initialize-ParetoArticleTemplate -ArticleRoot $paretoArticleRoot
if ($SiteOnly) {
    Invoke-ParetoMyst -MystArguments @('build', '--site')
} else {
    Invoke-ParetoMyst -MystArguments @('build', '--html')
}
