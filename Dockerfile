ARG INPUT_BASEIMAGE=sonarsource/sonar-scanner-cli:5.0.1
FROM ${INPUT_BASEIMAGE}

LABEL version="2.0.1" \
    repository="https://github.com/sonarsource/sonarqube-scan-action" \
    homepage="https://github.com/sonarsource/sonarqube-scan-action" \
    maintainer="SonarSource" \
    com.github.actions.name="SonarQube Scan" \
    com.github.actions.description="Scan your code with SonarQube to detect Bugs, Vulnerabilities and Code Smells in up to 27 programming languages!" \
    com.github.actions.icon="check" \
    com.github.actions.color="green"


COPY entrypoint.sh /sonarqube-scan-action/entrypoint.sh
RUN chmod +x /sonarqube-scan-action/entrypoint.sh
COPY cleanup.sh /sonarqube-scan-action/cleanup.sh
RUN chmod +x /sonarqube-scan-action/cleanup.sh
ENTRYPOINT ["/sonarqube-scan-action/entrypoint.sh"]
