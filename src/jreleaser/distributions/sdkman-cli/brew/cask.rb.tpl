# Generated with JReleaser 1.0.0-M1 at 2022-01-26T22:03:59.537647+01:00
cask "{{brewCaskName}}" do
  desc "{{projectDescription}}"
  homepage "{{projectWebsite}}"
  url "{{distributionUrl}}",
      verified: "{{repoHost}}"
  version "{{projectVersion}}"
  sha256 "{{distributionChecksumSha256}}"
  name "{{brewCaskDisplayName}}"
  {{#brewCaskHasAppcast}}
  appcast {{brewCaskAppcast}}
  {{/brewCaskHasAppcast}}
  auto_updates true

  {{#brewHasLivecheck}}
  livecheck do
    {{#brewLivecheck}}
    {{.}}
    {{/brewLivecheck}}
  end
  {{/brewHasLivecheck}}
  {{#brewDependencies}}
  depends_on {{.}}
  {{/brewDependencies}}

  {{#brewCaskHasPkg}}
  pkg "{{brewCaskPkg}}"
  {{/brewCaskHasPkg}}
  {{#brewCaskHasApp}}
  app "{{brewCaskApp}}"
  {{/brewCaskHasApp}}
  {{#brewCaskHasBinary}}
  binary "{{distributionArtifactFileName}}/bin/{{distributionExecutable}}"
  {{/brewCaskHasBinary}}
  {{#brewCaskHasUninstall}}
  {{#brewCaskUninstall}}
  uninstall {{name}}: [
    {{#items}}
    "{{.}}",
    {{/items}}
  ]
  {{/brewCaskUninstall}}
  {{/brewCaskHasUninstall}}
  {{#brewCaskHasZap}}
  {{#brewCaskZap}}
  zap {{name}}: [
    {{#items}}
    "{{.}}",
    {{/items}}
  ]
  {{/brewCaskZap}}
  {{/brewCaskHasZap}}
end
