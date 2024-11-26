@echo off
rem ##########################################################################
rem ##  batch make date : 2024.11.26 (ver 1.0)
rem ##  writer : lukka
rem ##  About Lincese : Free
rem ##  source chage  :  possible 
rem ##########################################################################

:: 반복/조건문 사용을 위해 동적업데이트 허용
setlocal enabledelayedexpansion


:: 바탕화면 경로 설정
set desktop=%USERPROFILE%\Desktop
set output_file=%desktop%\result.txt


:: 이전 결과 파일 삭제 (있는 경우)
if exist "%output_file%" del "%output_file%"
echo 같은 이름의 결과 파일을 삭제합니다.


echo 시스템 정보 수집을 시작합니다.

echo ############################ >> "%output_file%"
echo # 1. 시스템 정보 수집 시작 시간 기록 >> "%output_file%"
echo ############################ >> "%output_file%"

echo 수집 시작일시: %date% %time% >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 2. OS 및 네트워크 기본 정보 수집 >> "%output_file%"
echo ############################ >> "%output_file%"

echo [OS 정보] >> "%output_file%"
systeminfo >> "%output_file%"
echo ############################ >> "%output_file%"
echo [네트워크 정보] >> "%output_file%"
ipconfig /all >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 3. 사용자 정보 수집 >> "%output_file%"
echo ############################ >> "%output_file%"

echo [사용자 정보] >> "%output_file%"
whoami >> "%output_file%"
:: 시스템에 등록된 모든 사용자 계정 정보
net user >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 4. 공유 정보 >> "%output_file%"
echo ############################ >> "%output_file%"
echo [공유 정보] >> "%output_file%"
:: 공유 중인 폴더 및 자원 확인
net share >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 5. 시스템 기본 보안 설정 >> "%output_file%"
echo ############################ >> "%output_file%"

echo [기본 보안 설정] >> "%output_file%"
:: 보안 감사 정책을 출력
auditpol /get /category:* >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 6. 실행 중인 서비스 목록 >> "%output_file%"
echo ############################ >> "%output_file%"

echo [실행 중인 서비스 목록] >> "%output_file%"
:: 실행 중인 서비스 목록을 저장
sc.exe query type= service >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 7. 공유된 파일 실행 여부 >> "%output_file%"
echo ############################ >> "%output_file%"

echo [공유된 파일 실행 여부] >> "%output_file%"
:: 공유된 파일이 사용 중인지 확인 및 기록
net file >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo #  8. 프로세스 정보 >> "%output_file%"
echo ############################ >> "%output_file%"

echo [프로세스 정보] >> "%output_file%"
:: 현재 실행 중인 프로세스 목록 확인 및 기록
tasklist >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 9. 네트워크 관련 정보 >> "%output_file%"
echo ############################ >> "%output_file%"

echo [네트워크 관련 정보] >> "%output_file%"
:: 네트워크 연결 상태 및 포트 정보 기록
netstat -ano >> "%output_file%"
echo ############################ >> "%output_file%"

echo [네트워크 관련 정보 - ARP 테이블] >> "%output_file%"
arp -a >> "%output_file%"
echo ############################ >> "%output_file%"

echo [네트워크 관련 정보 - DNS 캐시] >> "%output_file%"
ipconfig /displaydns >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 10. 파일 생성/수정/접근 이력  >> "%output_file%"
echo ############################ >> "%output_file%"

echo [파일 시스템 접근 감사 설정 확인] >> "%output_file%"
auditpol /get /subcategory:"파일 시스템" >> "%output_file%"
echo ############################ >> "%output_file%"

:: wevtutil에서 이벤트 로그(4663번)을 쿼리/조회
echo [파일 생성/수정/접근 이력] >> "%output_file%"
echo **감사설정이 되어 있지 않으면 표시되지 않을 수 있습니다.** >> "%output_file%"
:: wevtutil qe Security /q:"*[System[(EventID=4663)]]" /f:text /c:10 >> "%output_file%" 아래와 같이 수정함
wevtutil qe Security /f:text | findstr /i "FileSystem" >>"%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 11. 시작 프로그램 목록 >> "%output_file%"
echo ############################ >> "%output_file%"

echo [시작 프로그램 목록] >> "%output_file%"
reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run >> "%output_file%"
echo ############################ >> "%output_file%"

echo ############################ >> "%output_file%"
echo # 시스템 정보 수집 종료 시간 기록 >> "%output_file%"
echo ############################ >> "%output_file%"

echo 시스템 정보 수집이 종료되었습니다.
echo ############################
echo 수집 종료일시: %date% %time% >> "%output_file%"

echo 시스템 정보가 바탕화면의 result.txt에 저장되었습니다.
pause
