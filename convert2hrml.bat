rmdir html\ /S /Q
xcopy img html\img\ /S

copy LICENSE html/LICENSE 

md output

"C:\Program Files (x86)\Pandoc\pandoc" AzureNodeJs.md -o output/AzureNodeJs.html
"C:\Program Files (x86)\Pandoc\pandoc" AzureTTN.md -o output/AzureTTN.html
"C:\Program Files (x86)\Pandoc\pandoc" AzureUWP.md -o output/AzureUWP.html
"C:\Program Files (x86)\Pandoc\pandoc" CommandsNodeJs.md -o output/CommandsNodeJs.html
"C:\Program Files (x86)\Pandoc\pandoc" CommandsTTN.md -o output/CommandsTTN.html
"C:\Program Files (x86)\Pandoc\pandoc" CommandsUwp.md -o output/CommandsUwp.html
"C:\Program Files (x86)\Pandoc\pandoc" developermode.md -o output/developermode.html
"C:\Program Files (x86)\Pandoc\pandoc" JavaToIotHub.md -o output/JavaToIotHub.html
"C:\Program Files (x86)\Pandoc\pandoc" NodeJsToIotHub.md -o output/NodeJsToIotHub.html
"C:\Program Files (x86)\Pandoc\pandoc" readme.md -o output/readme.html
"C:\Program Files (x86)\Pandoc\pandoc" TheThingsNetwork.md -o output/TheThingsNetwork.html
"C:\Program Files (x86)\Pandoc\pandoc" UwpToIotHub.md -o output/UwpToIotHub.html
"C:\Program Files (x86)\Pandoc\pandoc" Webjob.md -o output/Webjob.html

type output\AzureNodeJs.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\AzureNodeJs2.html
type output\AzureTTN.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\AzureTTN2.html
type output\AzureUWP.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\AzureUWP2.html
type output\CommandsNodeJs.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\CommandsNodeJs2.html
type output\CommandsTTN.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\CommandsTTN2.html
type output\CommandsUwp.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\CommandsUwp2.html
type output\developermode.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\developermode2.html
type output\JavaToIotHub.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\JavaToIotHub2.html
type output\NodeJsToIotHub.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\NodeJsToIotHub2.html
type output\readme.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\readme2.html
type output\TheThingsNetwork.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\TheThingsNetwork2.html
type output\UwpToIotHub.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\UwpToIotHub2.html
type output\Webjob.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\Webjob2.html

powershell -Command "Add-Content html\AzureNodeJs2.html '</body></html>'
powershell -Command "Add-Content html\AzureTTN2.html '</body></html>'
powershell -Command "Add-Content html\AzureUWP2.html '</body></html>'
powershell -Command "Add-Content html\CommandsNodeJs2.html '</body></html>'
powershell -Command "Add-Content html\CommandsTTN2.html '</body></html>'
powershell -Command "Add-Content html\CommandsUwp2.html '</body></html>'
powershell -Command "Add-Content html\developermode2.html '</body></html>'
powershell -Command "Add-Content html\JavaToIotHub2.html '</body></html>'
powershell -Command "Add-Content html\NodeJsToIotHub2.html '</body></html>'
powershell -Command "Add-Content html\readme2.html '</body></html>'
powershell -Command "Add-Content html\TheThingsNetwork2.html '</body></html>'
powershell -Command "Add-Content html\UwpToIotHub2.html '</body></html>'
powershell -Command "Add-Content html\Webjob2.html '</body></html>'

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\AzureNodeJs.html
Powershell -Command "Get-Content html\AzureNodeJs2.html | Add-Content -Path html\AzureNodeJs.html"
del html\AzureNodeJs2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\AzureTTN.html
Powershell -Command "Get-Content html\AzureTTN2.html | Add-Content -Path html\AzureTTN.html"
del html\AzureTTN2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\AzureUWP.html
Powershell -Command "Get-Content html\AzureUWP2.html | Add-Content -Path html\AzureUWP.html"
del html\AzureUWP2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\CommandsNodeJs.html
Powershell -Command "Get-Content html\CommandsNodeJs2.html | Add-Content -Path html\CommandsNodeJs.html"
del html\CommandsNodeJs2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\CommandsTTN.html
Powershell -Command "Get-Content html\CommandsTTN2.html | Add-Content -Path html\CommandsTTN.html"
del html\CommandsTTN2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\CommandsUwp.html
Powershell -Command "Get-Content html\CommandsUwp2.html | Add-Content -Path html\CommandsUwp.html"
del html\CommandsUwp2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\developermode.html
Powershell -Command "Get-Content html\developermode2.html | Add-Content -Path html\developermode.html"
del html\developermode2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\JavaToIotHub.html
Powershell -Command "Get-Content html\JavaToIotHub2.html | Add-Content -Path html\JavaToIotHub.html"
del html\JavaToIotHub2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\NodeJsToIotHub.html
Powershell -Command "Get-Content html\NodeJsToIotHub2.html | Add-Content -Path html\NodeJsToIotHub.html"
del html\NodeJsToIotHub2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\readme.html
Powershell -Command "Get-Content html\readme2.html | Add-Content -Path html\readme.html"
del html\readme2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\TheThingsNetwork.html
Powershell -Command "Get-Content html\TheThingsNetwork2.html | Add-Content -Path html\TheThingsNetwork.html"
del html\TheThingsNetwork2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\UwpToIotHub.html
Powershell -Command "Get-Content html\UwpToIotHub2.html | Add-Content -Path html\UwpToIotHub.html"
del html\UwpToIotHub2.html

echo ^<^!DOCTYPE html^>^<html^>^<head^>^<meta charset^=utf^-8 /^>^</head^>^<body^> > html\Webjob.html
Powershell -Command "Get-Content html\Webjob2.html | Add-Content -Path html\Webjob.html"
del html\Webjob2.html

rmdir output\ /S /Q

pause