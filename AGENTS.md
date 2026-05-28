## Stack
Ruby (version unspecified), Bundler for dependency management, Docker for containerisation. Email service application.

## Constraints
Never modify: `Gemfile.lock`, `*.lock`, credential files, secrets, environment files (`.env*`), generated code, Dockerfiles unless running dockerfile_lint skill.

## Conventions
Ruby source files follow RuboCop style conventions. Tests live in `spec/` or `test/` directory if present. Code organised as a standalone service with Docker entrypoint.

## Dependency manifests
- `Gemfile` — Ruby gem version declarations (edit this to update gems)
- `Gemfile.lock` — auto-generated lock file, never edit manually

## Notes for specific skills
- **dependency_updates**: Edit `Gemfile` only; run `bundle update` to regenerate `Gemfile.lock`
- **ruby_style_autofix**: Run `rubocop --autocorrect`; do not modify files outside Ruby source
- **dockerfile_lint**: Lint and fix `Dockerfile` only; do not alter application logic
- **cve_scan**: Check gems in `Gemfile.lock` against known CVEs; propose `Gemfile` changes only
- **code_quality / security**: Read-only analysis; do not modify files unless a separate fix skill is invoked
