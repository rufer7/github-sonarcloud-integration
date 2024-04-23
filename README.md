# github-sonarcloud-integration

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=bugs)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=code_smells)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=coverage)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=duplicated_lines_density)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=ncloc)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=security_rating)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=sqale_index)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=rufer7_github-sonarcloud-integration)

Scan GitHub repository with SonarCloud

## Setup

1. Follow the docs under [SonarCloud - Getting Started with GitHub](https://docs.sonarsource.com/sonarcloud/getting-started/github/) to setup `SonarCloud` with `GitHub`
   1. Sign up at [SonarCloud](https://sonarcloud.io/)
   1. Click `Import another organization`
   1. Select your personal GitHub account or the organization that contains the repository you want to scan
   1. When reaching the `Create your SonarCloud organization` page adjust/update data and click `Create organization`
   1. On `Analyze projects` page select the repository you want to scan and click `Set Up`
   1. On `Set up project for Clean as You Code` page select the desired code definition and click `Create project`
1. After completing the setup, the repository will be scanned automatically and you will see the results on the `SonarCloud` dashboard

To set up analysis with GitHub actions, see [here](https://sonarcloud.io/project/analysis_method?id=rufer7_github-sonarcloud-integration)

## Scan Results

- The scan results can be viewed on the [`SonarCloud` dashboard](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)

## Useful Links

- [SonarCloud - Getting Started with GitHub](https://docs.sonarsource.com/sonarcloud/getting-started/github/)
- [Pull request analysis](https://docs.sonarsource.com/sonarcloud/improving/pull-request-analysis/#existing-pull-requests-on-first-automatic-analysis)
