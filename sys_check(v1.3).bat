@echo off
rem ##########################################################################
rem ##  batch make date : 2024.11.26 (ver 1.0)
rem ##  writer : lukka
rem ##  About Lincese : Free
rem ##  source chage  :  possible 
rem ##########################################################################

:: �ݺ�/���ǹ� ����� ���� ����������Ʈ ���
setlocal enabledelayedexpansion


:: ����ȭ�� ��� ����
set desktop=%USERPROFILE%\Desktop
set output_file=%desktop%\result.txt


:: ���� ��� ���� ���� (�ִ� ���)
if exist "%output_file%" del "%output_file%"
echo ���� �̸��� ��� ������ �����մϴ�.


echo �ý��� ���� ������ �����մϴ�.

echo ############################ >> "%output_file%"
echo # 1. �ý��� ���� ���� ���� �ð� ��� >> "%output_file%"
echo ############################ >> "%output_file%"

echo ���� �����Ͻ�: %date% %time% >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 2. OS �� ��Ʈ��ũ �⺻ ���� ���� >> "%output_file%"
echo ############################ >> "%output_file%"

echo [OS ����] >> "%output_file%"
systeminfo >> "%output_file%"
echo ############################ >> "%output_file%"
echo [��Ʈ��ũ ����] >> "%output_file%"
ipconfig /all >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 3. ����� ���� ���� >> "%output_file%"
echo ############################ >> "%output_file%"

echo [����� ����] >> "%output_file%"
whoami >> "%output_file%"
:: �ý��ۿ� ��ϵ� ��� ����� ���� ����
net user >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 4. ���� ���� >> "%output_file%"
echo ############################ >> "%output_file%"
echo [���� ����] >> "%output_file%"
:: ���� ���� ���� �� �ڿ� Ȯ��
net share >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 5. �ý��� �⺻ ���� ���� >> "%output_file%"
echo ############################ >> "%output_file%"

echo [�⺻ ���� ����] >> "%output_file%"
:: ���� ���� ��å�� ���
auditpol /get /category:* >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 6. ���� ���� ���� ��� >> "%output_file%"
echo ############################ >> "%output_file%"

echo [���� ���� ���� ���] >> "%output_file%"
:: ���� ���� ���� ����� ����
sc.exe query type= service >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 7. ������ ���� ���� ���� >> "%output_file%"
echo ############################ >> "%output_file%"

echo [������ ���� ���� ����] >> "%output_file%"
:: ������ ������ ��� ������ Ȯ�� �� ���
net file >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo #  8. ���μ��� ���� >> "%output_file%"
echo ############################ >> "%output_file%"

echo [���μ��� ����] >> "%output_file%"
:: ���� ���� ���� ���μ��� ��� Ȯ�� �� ���
tasklist >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 9. ��Ʈ��ũ ���� ���� >> "%output_file%"
echo ############################ >> "%output_file%"

echo [��Ʈ��ũ ���� ����] >> "%output_file%"
:: ��Ʈ��ũ ���� ���� �� ��Ʈ ���� ���
netstat -ano >> "%output_file%"
echo ############################ >> "%output_file%"

echo [��Ʈ��ũ ���� ���� - ARP ���̺�] >> "%output_file%"
arp -a >> "%output_file%"
echo ############################ >> "%output_file%"

echo [��Ʈ��ũ ���� ���� - DNS ĳ��] >> "%output_file%"
ipconfig /displaydns >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 10. ���� ����/����/���� �̷�  >> "%output_file%"
echo ############################ >> "%output_file%"

echo [���� �ý��� ���� ���� ���� Ȯ��] >> "%output_file%"
auditpol /get /subcategory:"���� �ý���" >> "%output_file%"
echo ############################ >> "%output_file%"

:: wevtutil���� �̺�Ʈ �α�(4663��)�� ����/��ȸ
echo [���� ����/����/���� �̷�] >> "%output_file%"
echo **���缳���� �Ǿ� ���� ������ ǥ�õ��� ���� �� �ֽ��ϴ�.** >> "%output_file%"
:: wevtutil qe Security /q:"*[System[(EventID=4663)]]" /f:text /c:10 >> "%output_file%" �Ʒ��� ���� ������
wevtutil qe Security /f:text | findstr /i "FileSystem" >>"%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 11. ���� ���α׷� ��� >> "%output_file%"
echo ############################ >> "%output_file%"

echo [���� ���α׷� ���] >> "%output_file%"
reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # �ý��� ���� ���� ���� �ð� ��� >> "%output_file%"
echo ############################ >> "%output_file%"

echo �ý��� ���� ������ ����Ǿ����ϴ�.
echo ############################
echo ���� �����Ͻ�: %date% %time% >> "%output_file%"

echo �ý��� ������ ����ȭ���� result.txt�� ����Ǿ����ϴ�.
pause
