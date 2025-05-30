# JSP 실행 가능한 Tomcat 이미지 기반 (Java 17 지원)
FROM tomcat:9.0-jdk17

# WAR 배포 전 기본 webapps 폴더 제거 (불필요한 예제 제거)
RUN rm -rf /usr/local/tomcat/webapps/*

# build된 WAR 파일을 컨테이너 내부로 복사
COPY ../web/build/libs/*.war /usr/local/tomcat/webapps/ROOT.war

# 포트 노출
EXPOSE 8080