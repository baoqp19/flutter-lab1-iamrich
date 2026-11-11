# Original geometric artwork, rendered locally with Windows System.Drawing.
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing
$assetDirectory = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../images'))
[System.IO.Directory]::CreateDirectory($assetDirectory) | Out-Null
$bitmap = New-Object System.Drawing.Bitmap 768,640
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.Clear([System.Drawing.Color]::Transparent)

function Draw-Facet($color, $coordinates) {
    $points = for ($i = 0; $i -lt $coordinates.Length; $i += 2) {
        New-Object System.Drawing.PointF $coordinates[$i],$coordinates[$i + 1]
    }
    $brush = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml($color))
    try { $graphics.FillPolygon($brush, [System.Drawing.PointF[]]$points) }
    finally { $brush.Dispose() }
}

try {
    Draw-Facet '#DDFBFF' @(174,110, 292,110, 246,246, 76,246)
    Draw-Facet '#9DDCEB' @(292,110, 384,110, 246,246)
    Draw-Facet '#F1FDFF' @(384,110, 246,246, 522,246)
    Draw-Facet '#BDEAF4' @(384,110, 476,110, 522,246)
    Draw-Facet '#79BED8' @(476,110, 594,110, 692,246, 522,246)
    Draw-Facet '#9AD9EB' @(76,246, 246,246, 384,560)
    Draw-Facet '#D4F6FC' @(246,246, 384,246, 384,560)
    Draw-Facet '#9EE0F1' @(384,246, 522,246, 384,560)
    Draw-Facet '#519FBE' @(522,246, 692,246, 384,560)
    Draw-Facet '#FFFFFF' @(174,110, 292,110, 266,124, 184,124, 98,237, 76,246)
    Draw-Facet '#E7FBFF' @(76,246, 692,246, 680,254, 86,254)
    # A small four-point highlight on the upper-left facet.
    Draw-Facet '#FFFFFF' @(184,145, 194,183, 232,193, 194,203, 184,241, 174,203, 136,193, 174,183)
    $bitmap.Save((Join-Path $assetDirectory 'diamond.png'), [System.Drawing.Imaging.ImageFormat]::Png)
}
finally {
    $graphics.Dispose()
    $bitmap.Dispose()
}
