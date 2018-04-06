rmdir output\img\ /S /Q
xcopy img output\img\ /S

rmdir html\img\ /S /Q
xcopy img html\img\ /S

copy LICENSE output/LICENSE 
copy LICENSE html/LICENSE 

python -m markdown AzureNodeJs.md > output/AzureNodeJs.html
python -m markdown AzureTTN.md > output/AzureTTN.html
python -m markdown AzureUWP.md > output/AzureUWP.html
python -m markdown CommandsNodeJs.md > output/CommandsNodeJs.html
python -m markdown CommandsTTN.md > output/CommandsTTN.html
python -m markdown CommandsUwp.md > output/CommandsUwp.html
python -m markdown developermode.md > output/developermode.html
python -m markdown JavaToIotHub.md > output/JavaToIotHub.html
python -m markdown NodeJsToIotHub.md > output/NodeJsToIotHub.html
python -m markdown readme.md > output/readme.html
python -m markdown TheThingsNetwork.md > output/TheThingsNetwork.html
python -m markdown UwpToIotHub.md > output/UwpToIotHub.html
python -m markdown Webjob.md > output/Webjob.html



type output\AzureNodeJs.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\AzureNodeJs.html
type output\AzureTTN.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\AzureTTN.html
type output\AzureUWP.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\AzureUWP.html
type output\CommandsNodeJs.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\CommandsNodeJs.html
type output\CommandsTTN.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\CommandsTTN.html
type output\CommandsUwp.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\CommandsUwp.html
type output\developermode.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\developermode.html
type output\JavaToIotHub.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\JavaToIotHub.html
type output\NodeJsToIotHub.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\NodeJsToIotHub.html
type output\readme.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\readme.html
type output\TheThingsNetwork.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\TheThingsNetwork.html
type output\UwpToIotHub.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\UwpToIotHub.html
type output\Webjob.html | powershell -Command "$input | ForEach-Object { $_ -replace \".md\", \".html\" }" > html\Webjob.html

rmdir output\ /S /Q

pause