#!/usr/bin/env pwsh

Set-Content -Path .\zxspb.fnt -Value @"
info face=zxspb size=8 unicode=0 bold=0 italic=0 stretchH=100 aa=1 padding=0,0,0,0 spacing=0,0
common lineHeight=8 base=0 scaleW=128 scaleH=56 pages=1
page id=0 file=zxspb.png
"@

Set-Content -Path .\zxspw.fnt -Value @"
info face=zxspw size=8 unicode=0 bold=0 italic=0 stretchH=100 aa=1 padding=0,0,0,0 spacing=0,0
common lineHeight=8 base=0 scaleW=128 scaleH=56 pages=1
page id=0 file=zxspw.png
"@

$chars = ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_£abcdefghijklmnopqrstuvwxyz{|}~'.ToCharArray()

for ($i = 0; $i -lt 95; $i++)
{
  $code = [byte][char]$chars[$i]
  $x = $i%16*8
  $y = [math]::Floor($i/16)*8

  Add-Content -Path .\zxspb.fnt -Value "char id=$code x=$x y=$y width=8 height=8 xoffset=0 yoffset=0 xadvance=8 page=0 chnl=15"
  Add-Content -Path .\zxspw.fnt -Value "char id=$code x=$x y=$y width=8 height=8 xoffset=0 yoffset=0 xadvance=8 page=0 chnl=15"
}