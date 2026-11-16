FROM mcr.microsoft.com/windows:1809 AS fullwindows

# Copy fonts from fullwindows image, exclude lucon.ttf as it already exists
RUN powershell -NoProfile -Command Copy-Item C:/windows/fonts c:/fonts -Exclude lucon.ttf -Recurse

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

COPY --from=fullwindows c:/fonts c:/windows/fonts

# Copy oledlg dll for crystal reports installer to work
COPY --from=fullwindows c:/windows/System32/oledlg.dll c:/windows/System32
COPY --from=fullwindows c:/windows/SysWOW64/oledlg.dll c:/windows/SysWOW64

# Register fonts and download and install Crystal Reports Runtime
# For logging, add '/L*V ./cr_redist.log' to installer arguments
RUN New-Item -ItemType Directory -Path ./install -Force | Out-Null; \
Invoke-WebRequest https://raw.githubusercontent.com/jason-jxc/FontReg/master/bin.x86-64/FontReg.exe -OutFile ./install/FontReg.exe; \
./install/FontReg.exe; \
Invoke-WebRequest https://aka.ms/vc14/vc_redist.x64.exe -O ./install/vc_redist.exe; \
Invoke-WebRequest https://origin-az.softwaredownloads.sap.com/public/file/0020000000374522026 -O ./install/cr_redist.msi; \
Start-Process ./install/vc_redist.exe '/quiet', '/NoRestart' -Wait; \
Start-Process ./install/cr_redist.msi '/quiet', '/NoRestart' -Wait; \
Remove-Item ./install -Recurse
