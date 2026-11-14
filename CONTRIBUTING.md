# Contributing to Aqzelo Desktop

Thank you for your interest in contributing! This document outlines the process and guidelines for contributing to Aqzelo.

## Getting Started

### Prerequisites

- **Windows:** Visual Studio 2022 Build Tools, Qt 5.15.x (static), Python 3.12+, Rust, Git
- **Linux:** GCC/Clang, Qt 5.15+, CMake 3.25+, Python 3.12+
- **macOS:** Xcode Command Line Tools, Qt 5.15+, CMake 3.25+

### Building Locally

```bash
# Clone with submodules
git clone --recursive https://github.com/motelyz/aqzelo.git
cd aqzelo

# Windows
Telegram\build\prepare\win.bat
configure.bat x64 -D TDESKTOP_API_ID=2040 -D TDESKTOP_API_HASH=b18441a1ff607e10a989891a5462e627
cmake --build out --config Release --target Telegram

# Linux/macOS
./Telegram/build/prepare/linux.sh  # or mac.sh
cmake -B out -DCMAKE_BUILD_TYPE=Release -DTDESKTOP_API_ID=... -DTDESKTOP_API_HASH=...
cmake --build out --config Release --target Telegram
```

See [docs/building-win-x64.md](docs/building-win-x64.md), [docs/building-linux.md](docs/building-linux.md), [docs/building-mac.md](docs/building-mac.md) for detailed guides.

## How to Contribute

### 1. Fork & Branch

```bash
# Fork on GitHub, then:
git clone https://github.com/YOUR_USERNAME/aqzelo.git
cd aqzelo
git checkout -b feature/your-feature-name
```

### 2. Make Changes

- Follow the existing code style (see [Coding Style](#coding-style))
- Write clear commit messages
- Test your changes locally

### 3. Submit Pull Request

- Push to your fork
- Open PR against `motelyz/aqzelo:master`
- Describe what you changed and why
- Link related issues

## Coding Style

### C++

- **Standard:** C++20
- **Formatting:** Follow existing code style in the repository
- **Naming:**
  - Classes/Types: `PascalCase` (`MyClass`)
  - Functions/Variables: `camelCase` (`myFunction`, `myVariable`)
  - Private members: `_underscorePrefix` (`_value`)
  - Constants: `kPascalCase` (`kMaxSize`)
- **Includes:** System → Qt → Project → Local, alphabetical within groups
- **No trailing whitespace**, max 120 chars/line

### Commits

```
<type>(<scope>): <short description>

<body if needed>

Fixes #<issue-number>
```

Types: `feat`, `fix`, `refactor`, `docs`, `style`, `test`, `chore`, `build`, `ci`

Examples:
```
feat(ui): add custom theme editor
fix(core): resolve crash on invalid lottie
docs: update windows build guide
```

### Pull Requests

- **Title:** Follow commit format
- **Description:** What, why, how tested
- **Small, focused PRs** preferred over large ones
- **CI must pass** before merge

## Reporting Issues

### Bug Reports

Include:
- OS, version, architecture
- Aqzelo version (from Settings → About)
- Steps to reproduce
- Expected vs actual behavior
- Logs/screenshots if applicable

### Feature Requests

- Clear use case
- Why it belongs in Aqzelo (not upstream)
- Mockups/designs if UI-related

## Code Review

All PRs require review. Reviewers check:
- Correctness & logic
- Code style compliance
- Performance implications
- Test coverage
- Documentation updates

## License

By contributing, you agree that your contributions will be licensed under **GPL v3** (same as the project).

## Community

- **Telegram Channel:** [@Aqzelo](https://t.me/Aqzelo)
- **FAQ:** [@AqzeloFAQ](https://t.me/AqzeloFAQ)
- **Issues:** [GitHub Issues](https://github.com/motelyz/aqzelo/issues)

## Maintainer

[@motelyz](https://github.com/motelyz) — final say on merges and direction.