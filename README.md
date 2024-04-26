# github-sonarcloud-integration

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=alert_status)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=bugs)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=code_smells)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=coverage)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=duplicated_lines_density)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=ncloc)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=reliability_rating)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=security_rating)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=sqale_index)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=sqale_rating)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=rufer7_github-sonarcloud-integration&metric=vulnerabilities)](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)

Scan and analyze GitHub repository with SonarCloud

## Setup

### Automatic Analysis

> [!IMPORTANT]
> With Automatic Analysis for .Net, certain rules for .Net source code are automatically deactivated. This includes security rules, all rules that come from outside the Sonar Way quality profile, as well as certain rules from within it.

> [!NOTE]
> Automatic analysis is only supported for GitHub repositories. If you are using a different version control system, you will need to use a different method to analyze your code.

1. Follow the docs under [SonarCloud - Getting Started with GitHub](https://docs.sonarsource.com/sonarcloud/getting-started/github/) to setup `SonarCloud` with `GitHub`
   1. Sign up at [SonarCloud](https://sonarcloud.io/)
   1. Click `Import another organization`
   1. Select your personal GitHub account or the organization that contains the repository you want to scan
   1. When reaching the `Create your SonarCloud organization` page adjust/update data and click `Create organization`
   1. On `Analyze projects` page select the repository you want to scan and click `Set Up`
   1. On `Set up project for Clean as You Code` page select the desired code definition and click `Create project`
1. After completing the setup, the repository will be scanned automatically and you will see the results on the `SonarCloud` dashboard

### CI-based analysis

> [!IMPORTANT]
> Assumption: Automatic analysis is already set up for the repository

To set up CI-based analysis with GitHub actions follow the instructions (guided wizard) under https://sonarcloud.io/project/configuration/GitHubActions?id=SONAR_CLOUD_PROJECT_ID

> [!NOTE]  
> Replace `SONAR_CLOUD_PROJECT_ID` with the id of the SonarCloud project

#### Include languages other than C#

To include i.e. terraform files in the analysis of SonarScanner for .NET, the following adjustments are required.

1. Extend the `dotnet-sonarscanner begin` command with project base dir argument `/d:sonar.projectBaseDir="D:\a\GITHUB_PROJECT_NAME\GITHUB_PROJECT_NAME"` where `GITHUB_PROJECT_NAME` is the name of the GitHub project
1. Include the corresponding source files/folders in one of the projects `csproj` file

   ```xml
   <ItemGroup>
      <!-- This is required to include terraform files in SonarCloud analysis -->
      <Content Include="..\..\deploy\**\*.tf" Visible="false">
         <CopyToOutputDirectory>Never</CopyToOutputDirectory>
      </Content>
   </ItemGroup>
   ```

   For more details see [here](https://docs.sonarsource.com/sonarqube/9.8/analyzing-source-code/scanners/sonarscanner-for-dotnet/#advanced-topics)

#### Include test coverage

To include test coverage in the analysis of SonarScanner for .NET, the following adjustments are required in the GitHub actions workflow (`.github/workflows/quality.yml`).

```yaml
# Install dotnet-coverage
- name: Install dotnet-coverage
  shell: powershell
  run: |
    dotnet tool install --global dotnet-coverage
- name: Build and analyze
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }} # Needed to get PR information, if any
    SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
  shell: powershell
  run: |
    # Add /d:sonar.cs.vscoveragexml.reportsPaths=coverage.xml
    .\.sonar\scanner\dotnet-sonarscanner begin /k:"rufer7_github-sonarcloud-integration" /o:"rufer7" /d:sonar.token="${{ secrets.SONAR_TOKEN }}" /d:sonar.host.url="https://sonarcloud.io" /d:sonar.projectBaseDir="D:\a\github-sonarcloud-integration\github-sonarcloud-integration" /d:sonar.cs.vscoveragexml.reportsPaths=coverage.xml
    dotnet build .\src\ArbitrarySolution.sln --configuration Release
    # Execute tests and collect coverage
    dotnet-coverage collect 'dotnet test .\src\ArbitraryProject.Tests\ArbitraryProject.Tests.csproj' -f xml  -o 'coverage.xml'
    .\.sonar\scanner\dotnet-sonarscanner end /d:sonar.token="${{ secrets.SONAR_TOKEN }}"
```

#### Include test coverage

To include test coverage in the analysis of SonarScanner for .NET, the following adjustments are required in the

## Scan Results

### SonarCloud

The scan results can be viewed on the [`SonarCloud` dashboard](https://sonarcloud.io/summary/overall?id=rufer7_github-sonarcloud-integration)

### GitHub

Security hotspots detected by SonarCloud can be viewed directly on the [GitHub repository under `Security` tab in the `Code scanning` section](https://github.com/rufer7/github-sonarcloud-integration/security/code-scanning)

**Example**

![Code scanning alert](./assets/code-scanning-alert.png)

### Pull Request (GitHub)

Pull request analysis results can be found directly on the pull requests.

For an example, see [here](https://github.com/rufer7/github-sonarcloud-integration/pull/5)

## Useful Links

- [SonarCloud - Getting Started with GitHub](https://docs.sonarsource.com/sonarcloud/getting-started/github/)
- [Pull request analysis](https://docs.sonarsource.com/sonarcloud/improving/pull-request-analysis/#existing-pull-requests-on-first-automatic-analysis)
- [.NET test coverage](https://docs.sonarsource.com/sonarqube/9.8/analyzing-source-code/test-coverage/dotnet-test-coverage/)
