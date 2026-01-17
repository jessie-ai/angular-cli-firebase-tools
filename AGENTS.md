# AGENTS.md

Docker image with Angular CLI, Firebase CLI, Mocha, Nx, PNPM. Published to `jessieai/angular-cli-firebase-tools`.

## Key Files

- `Dockerfile` - Single Dockerfile with build args
- `.github/workflows/default.yml` - CI/CD pipeline (contains `VERSION`)

## Build & Verify

```bash
# Build locally
docker build . -t angular-cli-firebase-tools:local --build-arg VERSION=15.3.1

# Verify
docker run --rm angular-cli-firebase-tools:local firebase -V
docker run --rm angular-cli-firebase-tools:local ng version
```

## No Tests

Validation = successful build + tool verification.

## Version Updates

**Firebase Tools**: Edit `VERSION` in `.github/workflows/default.yml`

**New Node.js version**: Add to `matrix.context` in workflow:
```yaml
{ node_tag: '24-alpine', node: 'node-24', os: 'alpine', latest: false }
```

## Conventions

- **Formatting**: 2 spaces, UTF-8, LF endings (see `.editorconfig`)
- **Commits**: `<type>: <description>` (feat, fix, docs, chore)
- **Dockerfile**: Combine RUN commands, clean npm cache, run as `node` user

## Important

- Version is in workflow YAML, not Dockerfile
- All images are Alpine-based
- Never commit Docker Hub credentials
