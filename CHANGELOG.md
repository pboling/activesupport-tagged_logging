# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
### Changed
### Fixed
### Removed

## [2.0.3] - 2024-11-22
- COVERAGE:  98.11% -- 104/106 lines in 5 files
- BRANCH COVERAGE:  81.82% -- 18/22 branches in 5 files
- 36.36% documented
### Changed
- upgrade activesupport-logger v2.0.3
- upgrade activesupport-broadcast_logger v2.0.3

## [2.0.2] - 2024-11-22
- COVERAGE:  98.11% -- 104/106 lines in 5 files
- BRANCH COVERAGE:  81.82% -- 18/22 branches in 5 files
- 36.36% documented
### Changed
- upgrade activesupport-logger v2.0.2
- upgrade activesupport-broadcast_logger v2.0.2
### Fixed
- rdoc as development dependency (was runtime, which interfered with Rails' psych dependency)

## [2.0.1] - 2024-11-21
- COVERAGE:  98.11% -- 104/106 lines in 5 files
- BRANCH COVERAGE:  81.82% -- 18/22 branches in 5 files
- 36.36% documented
### Changed
- Upgraded to activesupport-broadcast_logger v2.0.1
- Upgraded to activesupport-logger v2.0.1
### Fixed
- Compatibility with ActiveSupport
  - Many libraries do `require "active_support"`

## [2.0.0] - 2024-11-21
- COVERAGE:  98.11% -- 104/106 lines in 5 files
- BRANCH COVERAGE:  81.82% -- 18/22 branches in 5 files
- 36.36% documented
### Changed
- `ActiveSupport::FixPr53105` => `Activesupport::FixPr53105`
  - **BREAKING CHANGE**: change `ActiveSupport::FixPr53105.init` to `Activesupport::FixPr53105.init`
  - This is to keep the code of this gem in a consistent namespace separate from the standard Rails `ActiveSupport`.
- Upgrade to `activesupport-logger` v2.0.0
### Fixed
- Compatibility with Rails v5.2, v6.0, v6.1, v7.0, v7.1, and v8
### Added
- Dependency on `activesupport-broadcast_logger` v2.0.0
- Real test suite

## [1.0.0] - 2024-10-10
- COVERAGE:  46.84% -- 74/158 lines in 6 files
- BRANCH COVERAGE:  21.74% -- 5/23 branches in 6 files
- 37.78% documented
### Added
- Initial release
