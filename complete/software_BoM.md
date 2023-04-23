# Produce a software BoM
Follow these steps:

1. Add CycloneDx BOM plugin to [Gradle configuration](./build.gradle)
1. Generate software Bill of Materials (BoM): `./gradlew cyclonedxBom`

   NOTE the helpful shortcut in [`source_me.bash`](./source_me.bash).
1. Commit output to repository: `git add -f ./build/reports/*.json`

