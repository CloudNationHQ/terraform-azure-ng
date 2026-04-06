# Changelog

## [3.2.0](https://github.com/CloudNationHQ/terraform-azure-ng/compare/v3.1.0...v3.2.0) (2026-04-06)


### Features

* **deps:** bump github.com/cloudnationhq/az-cn-go-validor in /tests ([#27](https://github.com/CloudNationHQ/terraform-azure-ng/issues/27)) ([40aaeca](https://github.com/CloudNationHQ/terraform-azure-ng/commit/40aaeca3641aef1a308e09d638f1741518c146d0))

## [3.1.0](https://github.com/CloudNationHQ/terraform-azure-ng/compare/v3.0.0...v3.1.0) (2026-04-03)


### Features

* add missing outputs ([#25](https://github.com/CloudNationHQ/terraform-azure-ng/issues/25)) ([bcc83a2](https://github.com/CloudNationHQ/terraform-azure-ng/commit/bcc83a23474f52918c3545f35be21d90df06d300))

## [3.0.0](https://github.com/CloudNationHQ/terraform-azure-ng/compare/v2.0.0...v3.0.0) (2026-04-01)


### ⚠ BREAKING CHANGES

* Multiple subnets ([#23](https://github.com/CloudNationHQ/terraform-azure-ng/issues/23))

### Features

* **deps:** bump github.com/cloudnationhq/az-cn-go-validor in /tests ([#22](https://github.com/CloudNationHQ/terraform-azure-ng/issues/22)) ([5e4db7a](https://github.com/CloudNationHQ/terraform-azure-ng/commit/5e4db7acdfb3b4a509880290a0bbd5e746d2224f))
* **deps:** bump github.com/ulikunitz/xz from 0.5.10 to 0.5.14 in /tests ([#15](https://github.com/CloudNationHQ/terraform-azure-ng/issues/15)) ([4cddfe2](https://github.com/CloudNationHQ/terraform-azure-ng/commit/4cddfe26dadea71fb9304da784daae5319ea6ae5))
* **deps:** bump golang.org/x/crypto from 0.36.0 to 0.45.0 in /tests ([#20](https://github.com/CloudNationHQ/terraform-azure-ng/issues/20)) ([7abc187](https://github.com/CloudNationHQ/terraform-azure-ng/commit/7abc1879ef644dff09e62e7518a92912df31efc9))
* Multiple subnets ([#23](https://github.com/CloudNationHQ/terraform-azure-ng/issues/23)) ([aa94f55](https://github.com/CloudNationHQ/terraform-azure-ng/commit/aa94f55543737be87935683429825f8de54f5de6))

## [2.0.0](https://github.com/CloudNationHQ/terraform-azure-ng/compare/v1.1.2...v2.0.0) (2025-05-08)


### ⚠ BREAKING CHANGES

* The data structure changed, causing a recreate on existing resources.

### Upgrade from v1.1.2 to v2.0.0:

- Update module reference to: `version = "~> 2.0"`
- The property and variable resource_group is renamed to resource_group_name

### Features

* small refactor ([#10](https://github.com/CloudNationHQ/terraform-azure-ng/issues/10)) ([321d878](https://github.com/CloudNationHQ/terraform-azure-ng/commit/321d878e3c4764236cea7e4e7c2460845750721b))

## [1.1.2](https://github.com/CloudNationHQ/terraform-azure-ng/compare/v1.1.1...v1.1.2) (2025-04-14)


### Bug Fixes

* fix submodule generation from makefile ([#7](https://github.com/CloudNationHQ/terraform-azure-ng/issues/7)) ([8d96a80](https://github.com/CloudNationHQ/terraform-azure-ng/commit/8d96a8063bc938f2fa3480ce158f74adbfec1389))

## [1.1.1](https://github.com/CloudNationHQ/terraform-azure-ng/compare/v1.1.0...v1.1.1) (2025-04-04)


### Bug Fixes

* fix prefixes module reference in usage ([#5](https://github.com/CloudNationHQ/terraform-azure-ng/issues/5)) ([c7d3804](https://github.com/CloudNationHQ/terraform-azure-ng/commit/c7d3804542adf98cb37977fe9b7bc392ad700fae))

## [1.1.0](https://github.com/CloudNationHQ/terraform-azure-ng/compare/v1.0.0...v1.1.0) (2025-04-04)


### Features

* **deps:** bump golang.org/x/net from 0.34.0 to 0.36.0 in /tests ([#3](https://github.com/CloudNationHQ/terraform-azure-ng/issues/3)) ([29c9d2c](https://github.com/CloudNationHQ/terraform-azure-ng/commit/29c9d2ce7aa9f8842c8c706b8de6a0ebf24c0da2))

## 1.0.0 (2025-04-04)


### Features

* add initial files ([#1](https://github.com/CloudNationHQ/terraform-azure-ng/issues/1)) ([9c4f06b](https://github.com/CloudNationHQ/terraform-azure-ng/commit/9c4f06b895fbd0e002d862cc6f27ed5f29c0641e))
