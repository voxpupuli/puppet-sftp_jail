# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v5.0.0](https://github.com/voxpupuli/puppet-sftp_jail/tree/v5.0.0) (2025-03-07)

[Full Changelog](https://github.com/voxpupuli/puppet-sftp_jail/compare/v4.1.0...v5.0.0)

**Breaking changes:**

- Drop End of Life Redhat 7 and Centos 7/8 [\#123](https://github.com/voxpupuli/puppet-sftp_jail/pull/123) ([uoe-pjackson](https://github.com/uoe-pjackson))
- Drop Debian 10 support [\#110](https://github.com/voxpupuli/puppet-sftp_jail/pull/110) ([zilchms](https://github.com/zilchms))
- Drop Ubuntu 18.04 support [\#107](https://github.com/voxpupuli/puppet-sftp_jail/pull/107) ([zilchms](https://github.com/zilchms))
- Drop Puppet 6 support [\#99](https://github.com/voxpupuli/puppet-sftp_jail/pull/99) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Add Debian 12 support [\#112](https://github.com/voxpupuli/puppet-sftp_jail/pull/112) ([zilchms](https://github.com/zilchms))
- Add RHEL 8 and 9 support [\#111](https://github.com/voxpupuli/puppet-sftp_jail/pull/111) ([zilchms](https://github.com/zilchms))
- saz/ssh: Allow 12.x [\#109](https://github.com/voxpupuli/puppet-sftp_jail/pull/109) ([zilchms](https://github.com/zilchms))
- Add Ubuntu 22.04 support [\#108](https://github.com/voxpupuli/puppet-sftp_jail/pull/108) ([zilchms](https://github.com/zilchms))
- saz/ssh: Allow 11.x [\#106](https://github.com/voxpupuli/puppet-sftp_jail/pull/106) ([zilchms](https://github.com/zilchms))
- Add Puppet 8 support [\#102](https://github.com/voxpupuli/puppet-sftp_jail/pull/102) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 9.x [\#101](https://github.com/voxpupuli/puppet-sftp_jail/pull/101) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Update Readme [\#113](https://github.com/voxpupuli/puppet-sftp_jail/pull/113) ([rwaffen](https://github.com/rwaffen))
- restructure rspec and add sftp pull checks [\#95](https://github.com/voxpupuli/puppet-sftp_jail/pull/95) ([nod0n](https://github.com/nod0n))
- puppet-lint: Enable parameter\_types check [\#94](https://github.com/voxpupuli/puppet-sftp_jail/pull/94) ([bastelfreak](https://github.com/bastelfreak))

## [v4.1.0](https://github.com/voxpupuli/puppet-sftp_jail/tree/v4.1.0) (2021-10-26)

[Full Changelog](https://github.com/voxpupuli/puppet-sftp_jail/compare/v4.0.0...v4.1.0)

**Implemented enhancements:**

- accept jails and users as class parameters [\#91](https://github.com/voxpupuli/puppet-sftp_jail/pull/91) ([nod0n](https://github.com/nod0n))
- create sub directories in user homes [\#71](https://github.com/voxpupuli/puppet-sftp_jail/pull/71) ([nod0n](https://github.com/nod0n))

## [v4.0.0](https://github.com/voxpupuli/puppet-sftp_jail/tree/v4.0.0) (2021-09-17)

[Full Changelog](https://github.com/voxpupuli/puppet-sftp_jail/compare/v3.0.0...v4.0.0)

**Breaking changes:**

- Drop Puppet 5/Add Puppet 7 support [\#86](https://github.com/voxpupuli/puppet-sftp_jail/pull/86) ([root-expert](https://github.com/root-expert))
- the owning group of a users home directory defaults to $user, not to $name [\#78](https://github.com/voxpupuli/puppet-sftp_jail/pull/78) ([nod0n](https://github.com/nod0n))
- Make $sftp\_jail::user::jail a required parameter [\#77](https://github.com/voxpupuli/puppet-sftp_jail/pull/77) ([nod0n](https://github.com/nod0n))
- Drop EL6 and Ubuntu 14.04, add Ubuntu 18.04 & Debian 10 [\#67](https://github.com/voxpupuli/puppet-sftp_jail/pull/67) ([ekohl](https://github.com/ekohl))

**Implemented enhancements:**

- Add Debian 11 and Ubuntu 20.04 support [\#84](https://github.com/voxpupuli/puppet-sftp_jail/pull/84) ([nod0n](https://github.com/nod0n))
- validate class and defined resource parameters [\#81](https://github.com/voxpupuli/puppet-sftp_jail/pull/81) ([nod0n](https://github.com/nod0n))
- Allow jail creation without specifying a user [\#80](https://github.com/voxpupuli/puppet-sftp_jail/pull/80) ([nod0n](https://github.com/nod0n))
- Add a default password authentication setting [\#74](https://github.com/voxpupuli/puppet-sftp_jail/pull/74) ([nod0n](https://github.com/nod0n))
- Remove unused files and parameters [\#66](https://github.com/voxpupuli/puppet-sftp_jail/pull/66) ([ekohl](https://github.com/ekohl))

**Closed issues:**

- check debian version [\#42](https://github.com/voxpupuli/puppet-sftp_jail/issues/42)
- Documentation in init.pp is still boilerplate from the module generate skeleton [\#13](https://github.com/voxpupuli/puppet-sftp_jail/issues/13)

**Merged pull requests:**

- Allow up-to-date dependencies [\#88](https://github.com/voxpupuli/puppet-sftp_jail/pull/88) ([smortex](https://github.com/smortex))
- move creation of user home from jail.pp to user.pp [\#87](https://github.com/voxpupuli/puppet-sftp_jail/pull/87) ([nod0n](https://github.com/nod0n))
- Add puppet-lint-param-docs [\#82](https://github.com/voxpupuli/puppet-sftp_jail/pull/82) ([bastelfreak](https://github.com/bastelfreak))
- Refactor `sftp_jail::jail` file resources [\#76](https://github.com/voxpupuli/puppet-sftp_jail/pull/76) ([nod0n](https://github.com/nod0n))
- Simplify default values in sftp\_jail::jail [\#75](https://github.com/voxpupuli/puppet-sftp_jail/pull/75) ([nod0n](https://github.com/nod0n))
- Add a short usage info in readme [\#73](https://github.com/voxpupuli/puppet-sftp_jail/pull/73) ([nod0n](https://github.com/nod0n))
- Migrate documentation to Puppet strings [\#70](https://github.com/voxpupuli/puppet-sftp_jail/pull/70) ([nod0n](https://github.com/nod0n))
- hiera.yaml [\#68](https://github.com/voxpupuli/puppet-sftp_jail/pull/68) ([nod0n](https://github.com/nod0n))
- Use voxpupuli-acceptance [\#62](https://github.com/voxpupuli/puppet-sftp_jail/pull/62) ([ekohl](https://github.com/ekohl))

## [v3.0.0](https://github.com/voxpupuli/puppet-sftp_jail/tree/v3.0.0) (2020-04-06)

[Full Changelog](https://github.com/voxpupuli/puppet-sftp_jail/compare/v2.0.2...v3.0.0)

**Breaking changes:**

- drop Puppet 4 / Require Puppet 5.5.8 [\#60](https://github.com/voxpupuli/puppet-sftp_jail/pull/60) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- 0775 permissions for /incoming [\#52](https://github.com/voxpupuli/puppet-sftp_jail/pull/52) ([cogliostro](https://github.com/cogliostro))

**Closed issues:**

- Group permissions for /incoming wrong [\#51](https://github.com/voxpupuli/puppet-sftp_jail/issues/51)

**Merged pull requests:**

- Allow saz/ssh 5.x and 6.x [\#59](https://github.com/voxpupuli/puppet-sftp_jail/pull/59) ([bastelfreak](https://github.com/bastelfreak))
- Allow puppetlabs/stdlib 6.x [\#57](https://github.com/voxpupuli/puppet-sftp_jail/pull/57) ([dhoppe](https://github.com/dhoppe))
- Clean up acceptance spec helper [\#54](https://github.com/voxpupuli/puppet-sftp_jail/pull/54) ([ekohl](https://github.com/ekohl))
- modulesync 2.8.0 and allow puppet 6.x [\#53](https://github.com/voxpupuli/puppet-sftp_jail/pull/53) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.2](https://github.com/voxpupuli/puppet-sftp_jail/tree/v2.0.2) (2018-09-09)

[Full Changelog](https://github.com/voxpupuli/puppet-sftp_jail/compare/v2.0.1...v2.0.2)

**Merged pull requests:**

- allow saz/ssh 3.x and 4.x [\#49](https://github.com/voxpupuli/puppet-sftp_jail/pull/49) ([bastelfreak](https://github.com/bastelfreak))
- allow puppetlabs/stdlib 5.x [\#47](https://github.com/voxpupuli/puppet-sftp_jail/pull/47) ([bastelfreak](https://github.com/bastelfreak))
- Remove docker nodesets [\#43](https://github.com/voxpupuli/puppet-sftp_jail/pull/43) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#41](https://github.com/voxpupuli/puppet-sftp_jail/pull/41) ([bastelfreak](https://github.com/bastelfreak))
- drop EOL OSs; fix puppet version range [\#39](https://github.com/voxpupuli/puppet-sftp_jail/pull/39) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.1](https://github.com/voxpupuli/puppet-sftp_jail/tree/v2.0.1) (2018-03-29)

[Full Changelog](https://github.com/voxpupuli/puppet-sftp_jail/compare/v2.0.0...v2.0.1)

**Closed issues:**

- This module needs a labels sync! [\#14](https://github.com/voxpupuli/puppet-sftp_jail/issues/14)

**Merged pull requests:**

- Bump puppet to minimum supported version 4.10.0 [\#37](https://github.com/voxpupuli/puppet-sftp_jail/pull/37) ([bastelfreak](https://github.com/bastelfreak))

## [v2.0.0](https://github.com/voxpupuli/puppet-sftp_jail/tree/v2.0.0) (2017-10-13)

[Full Changelog](https://github.com/voxpupuli/puppet-sftp_jail/compare/v1.1.0...v2.0.0)

**Breaking changes:**

- BREAKING: Drop puppet 3 support. Replace validate\_\* with datatypes in init [\#30](https://github.com/voxpupuli/puppet-sftp_jail/pull/30) ([bastelfreak](https://github.com/bastelfreak))

**Closed issues:**

- concat::fragment error when initing jail  [\#26](https://github.com/voxpupuli/puppet-sftp_jail/issues/26)

**Merged pull requests:**

- Add LICENSE file [\#28](https://github.com/voxpupuli/puppet-sftp_jail/pull/28) ([alexjfisher](https://github.com/alexjfisher))

## [v1.1.0](https://github.com/voxpupuli/puppet-sftp_jail/tree/v1.1.0) (2017-01-12)

This is the last release with Puppet 3 support!
* Modulesync with latest Vox Pupuli defaults
* Improve fact mocking
* Move special facts into sepeate file
* Bump min version_requirement for Puppet + deps

## 2016-09-26 - Release 1.0.0
- Transfer to Vox Pupuli namespace
- Update tests for STRICT_VARS.

## 2016-05-29 - Release 0.1.3
- Fix duplicate declaration bug with ssh.
- Removed automatic inclusion of ssh class when sftp_jail is invoked (see previous bullet).

## [YANKED] 2016-05-29 - Release 0.1.2
- Accidental/Empty release

## 2016-03-31 - Release 0.1.0
- Initial release


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
