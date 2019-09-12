FROM mcr.microsoft.com/windows/servercore:ltsc2019
# change to most recent version
ENV VERSION 1.17.3

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# download and unpack
RUN Invoke-WebRequest -Uri https://nginx.org/download/nginx-$ENV:VERSION.zip -OutFile c:\nginx-$ENV:VERSION.zip
RUN	Expand-Archive -Path C:\nginx-$ENV:VERSION.zip -DestinationPath C:\ -Force
RUN	Remove-Item -Path c:\nginx-$ENV:VERSION.zip -Confirm:$False
RUN	Rename-Item -Path nginx-$ENV:VERSION -NewName nginx

# create directory to place https:// certificates
RUN New-Item -ItemType directory -Path C:\nginx\certs

# Make sure that Docker always uses default DNS servers which hosted by Dockerd.exe
RUN Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ServerPriorityTimeLimit -Value 0 -Type DWord; \
	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ScreenDefaultServers -Value 0 -Type DWord; \
	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name ScreenUnreachableServers -Value 0 -Type DWord

# Shorten DNS cache times
RUN Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name MaxCacheTtl -Value 30 -Type DWord; \
	Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters' -Name MaxNegativeCacheTtl -Value 30 -Type DWord

WORKDIR /nginx

EXPOSE 80
EXPOSE 443

CMD ["nginx"]