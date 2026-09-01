# Changelog

## [2.0.0](https://github.com/Jasviers/actions/compare/v1.0.0...v2.0.0) (2026-09-01)


### ✨ Features

* add actions linter (linter the linters) ([9980f8b](https://github.com/Jasviers/actions/commit/9980f8baa31a4a47cabc898d063c3123fabbd483))
* add actions schema, mocks and release action ([850e59a](https://github.com/Jasviers/actions/commit/850e59a868daa68ac1677ffa8c792f46c0aa26ff))
* add ansible support ([4385a48](https://github.com/Jasviers/actions/commit/4385a48b8cd4e9782c2b5620b445512725778522))
* add build and test job ([055fce7](https://github.com/Jasviers/actions/commit/055fce76a8639d220c45aa0714214e7b7190f025))
* add first version of security checks action ([3c435b4](https://github.com/Jasviers/actions/commit/3c435b4e2b44b8dc039d8d9aa512af30306a3f23))
* add first version of security checks action ([907e9e0](https://github.com/Jasviers/actions/commit/907e9e0de974720e2339bdec2121aa654ad8b2c8))
* add github token as input ([b07f1ac](https://github.com/Jasviers/actions/commit/b07f1ac903d97af44587bd22438eac9a6e6903e0))
* add security checks (git leaks and dependicies) ([a9fb1db](https://github.com/Jasviers/actions/commit/a9fb1db25810911cae34ba5bb182734c72c373ee))
* add sonar branch analysis and snyk local test ([c57ae18](https://github.com/Jasviers/actions/commit/c57ae18cd7589abb8f62496ff47edd94277f61f9))
* add spellcheck to go pipeline ([3dba2de](https://github.com/Jasviers/actions/commit/3dba2de7740b7cef250032fd6e400cbcdebd243e))
* add test action ([1ba83a3](https://github.com/Jasviers/actions/commit/1ba83a31ca0aa8a56a929de4d4506c60ef481b70))
* add unit test action ([0272610](https://github.com/Jasviers/actions/commit/0272610eecb108c94c3f84e3b87bfd07abdd003a))
* add unit test action ([d3818a7](https://github.com/Jasviers/actions/commit/d3818a7ad9e96937bba3043f26be1ba494c5b227))
* add update packages to image ([c226556](https://github.com/Jasviers/actions/commit/c2265568baaa48777c8bbad77ecde0c5184747d7))
* add yaml and kubernetes suport ([0d323a9](https://github.com/Jasviers/actions/commit/0d323a9befc0eb9c7a033acad304c17a328e4dce))
* change parameters for snyk action ([9e3ebff](https://github.com/Jasviers/actions/commit/9e3ebff16a1fcaad7225556800f5005224a4e90f))
* create action to generate python docs ([d2c79ff](https://github.com/Jasviers/actions/commit/d2c79ff3042f98b2a4fc80592fc739c8646431ca))
* create first version of build docker action ([e688dfa](https://github.com/Jasviers/actions/commit/e688dfa98bebbb4b1c71e4609f12cd08f2377f7d))
* create first version of build docker action ([06be22e](https://github.com/Jasviers/actions/commit/06be22e1b60b599869e59aeeb89e31f59f4b7856))
* create generic CI (for my common use lenguages) ([7e6be19](https://github.com/Jasviers/actions/commit/7e6be19ae69dba495dcbdcaa5eb678010c4da243))
* docker action generate SBOM ([e7da63a](https://github.com/Jasviers/actions/commit/e7da63a5122eb35c892f276c2d114cb9fd8f0d6b))
* evaluate if exist test folder ([5569462](https://github.com/Jasviers/actions/commit/55694621e8716dfe3a6812786f1eb07db06c93b5))
* example dockerfile ([adf5825](https://github.com/Jasviers/actions/commit/adf582511b34f9696f95656c69e4e65c2a6dbed9))
* first codeql for compliance version ([e70bbe4](https://github.com/Jasviers/actions/commit/e70bbe444ce1456c0577e213654f61259cc2dc43))
* go mod info and go.sum ([03a4ac1](https://github.com/Jasviers/actions/commit/03a4ac18b2c172d3a26bfea7458b036aff54a572))
* make better test sets ([89cf883](https://github.com/Jasviers/actions/commit/89cf88328609cf542951e38f707f7e8546b997f2))
* modernización CI/CD del repo de actions ([7bf2f99](https://github.com/Jasviers/actions/commit/7bf2f994177a35a1a8745385dd29a3018fa260c4))
* python and docker workflow example ([c83663b](https://github.com/Jasviers/actions/commit/c83663bf102d6360bf35b55f3178cf7b8da55d04))
* **quality:** remove prettier in markdown, prefer no modificate by gh ([e74eed6](https://github.com/Jasviers/actions/commit/e74eed6c58b87d605d9a57e8a8491ba39de61770))
* remove snyk to use trivy for files and add shellcheck ([71daad3](https://github.com/Jasviers/actions/commit/71daad36dec2c233dd2f1f1a1815bb6bf462e416))
* remove spell checks ([13fe436](https://github.com/Jasviers/actions/commit/13fe436d26865886f93b6f15bdd5dc23aa13bc59))
* remove spell checks ([b80a2c9](https://github.com/Jasviers/actions/commit/b80a2c92ca72c4fb002953b7063fd53734ef1748))
* remove unused files, add python and go expamples ([c15a5aa](https://github.com/Jasviers/actions/commit/c15a5aa33af5c430b77547a98fa4109203f2d937))
* requirements package ([d38340e](https://github.com/Jasviers/actions/commit/d38340ee5bbb5d283d81d29153ba73cb9bb6e52d))
* update actions and add ci and release workflows form other repositories to reuse ([d339050](https://github.com/Jasviers/actions/commit/d339050144d4fd251665faef76c57dc57c953ef9))
* update versions and add renovate to mantain repo updated ([98fab48](https://github.com/Jasviers/actions/commit/98fab48e33e0b5b5910f4b5c8fc055abf500df70))


### 🐛 Fixes

* add github token to pass permissions ([25197e6](https://github.com/Jasviers/actions/commit/25197e69c07f96949a623f66685bbf76d449ead9))
* add mandatory properties ([48a29b5](https://github.com/Jasviers/actions/commit/48a29b50f0d0742158b008400254e8fbb1d55a9f))
* add placeholders, return to actions folder, and fix other errors ([8e32b2f](https://github.com/Jasviers/actions/commit/8e32b2f09fd9acaf6868c106a35880434355d169))
* add snyk token as input and pass from the workflow ([49e83ae](https://github.com/Jasviers/actions/commit/49e83aeba1b74122fdd29641af15e20f614bb2a7))
* add snyk token as input and pass from the workflow ([3323e1d](https://github.com/Jasviers/actions/commit/3323e1d9e3cf3945abc44b174fae9e0291523fec))
* change checkout version ([759f427](https://github.com/Jasviers/actions/commit/759f427f1194e2b6828eb0097edae39a5ec4ddef))
* change docker trivy name ([abed740](https://github.com/Jasviers/actions/commit/abed7405f0a6c7693e65c12f04008bb72c1e4355))
* change go.mod version format ([c28fa37](https://github.com/Jasviers/actions/commit/c28fa37448a4a5a149c64be35af722989cf986a8))
* change properties format and add correct values ([fec2507](https://github.com/Jasviers/actions/commit/fec2507035643cf86c9880a98ef1add260a827b5))
* change sonarcloud action ([c8da880](https://github.com/Jasviers/actions/commit/c8da880b1a5dc3cc23d22656685e05b0f5a9d7d7))
* change sonarcloud action version ([8e5b792](https://github.com/Jasviers/actions/commit/8e5b79218ac028ef4b9aae8b454607ad40f0da84))
* change tags form trivy again ([2214a42](https://github.com/Jasviers/actions/commit/2214a42adbd076dfca973e56b783ef4472605ea8))
* change variable to obtain repo name ([dff6df4](https://github.com/Jasviers/actions/commit/dff6df4defa0101a104e44be849c953d35c301d4))
* **ci:** grant permissions for the self-release reusable-workflow call ([c1f7981](https://github.com/Jasviers/actions/commit/c1f79818681b9956ad4dc82187622c6c7efbc0be))
* **ci:** unblock self-release (markdownlint &lt;p&gt;, make-release@main) ([218d748](https://github.com/Jasviers/actions/commit/218d74896069a885383a8d1cda8d6f1448d6ebb6))
* create githubtoken and pass as input to action ([c07f49d](https://github.com/Jasviers/actions/commit/c07f49dda4d83ae0b849935fe2e0b821470ae0fa))
* create githubtoken and pass as input to action ([cbb84c2](https://github.com/Jasviers/actions/commit/cbb84c23c218a38f56d115cd570733bacfd4d3e8))
* error indent ([14e1233](https://github.com/Jasviers/actions/commit/14e12332d8c8f5ed63fed0a8a574b7c2c91f85c8))
* error indent ([df0580f](https://github.com/Jasviers/actions/commit/df0580f57aa17a7e01917b0e05fcb37f1beec8a7))
* make-release only checks makdown and spell ([36336e6](https://github.com/Jasviers/actions/commit/36336e65a9e93f06f28f87907e173b6775acad0d))
* missing dollar symbol ([7158284](https://github.com/Jasviers/actions/commit/7158284b3d0a4007a5c4e0d69cff065e689a25e3))
* move actions to root path and add test workflow ([5524b82](https://github.com/Jasviers/actions/commit/5524b82645b7f7bd62e79cb55cbe4550a5159b3a))
* organization name ([2590f6d](https://github.com/Jasviers/actions/commit/2590f6d5a202c30156b54bc41fac854b135ebdc7))
* quality checks reference from make-release ([924d0d1](https://github.com/Jasviers/actions/commit/924d0d1cdac901df54fa78f1f0569bc22ebbfff0))
* **release:** add required packages key to release-please config + version.txt ([84a804e](https://github.com/Jasviers/actions/commit/84a804e2055ec54bf9c5a75b12adc2ad1370b404))
* repair yaml indent ([81241af](https://github.com/Jasviers/actions/commit/81241af845f5ab6469a4c4674e1ba69d5882b1c3))
* repair yaml indent ([d919fda](https://github.com/Jasviers/actions/commit/d919fdae32bbe0d6b1d2587721839d55fcca24ab))
* replace tags in trivy scan ([5478717](https://github.com/Jasviers/actions/commit/5478717ccafa8b754d61a3e329495da35d24ddb0))
* resolve PR checks (gitleaks token, stale README, zizmor template-injection) ([5a95043](https://github.com/Jasviers/actions/commit/5a95043c9efb32122c779958184c8938c0262a9d))
* sarif upload version 4 ([8101e54](https://github.com/Jasviers/actions/commit/8101e542163369536df2297da2b973709fea2ad7))
* try to fix error adding checkout ([c8ed4f8](https://github.com/Jasviers/actions/commit/c8ed4f839133acc18e35d46ab14700bd19c81143))
* try to fix error adding checkout ([2bc1346](https://github.com/Jasviers/actions/commit/2bc1346591ea6d5b82f2aef7dac01e78ba6b5a8d))
* try to repair pipeline changing project key name ([0950482](https://github.com/Jasviers/actions/commit/09504829d5b3dc10847b82da12f1a26d4f7e5778))


### 🧹 Chores

* release 2.0.0 ([ef1239f](https://github.com/Jasviers/actions/commit/ef1239f9970f0fe90fab1445fb712dfa344847fd))


### 📚 Documentation

* **ci:** Add info about CI actions in the README ([503e2a5](https://github.com/Jasviers/actions/commit/503e2a591b44133beeb9561bd8c839b186dd404e))
* improve docs and add github templates ([6bba497](https://github.com/Jasviers/actions/commit/6bba49746dcd9764d3f35d097ab944b413099efe))


### 🛠 Refactors

* **actions:** repository folder structure ([079ce10](https://github.com/Jasviers/actions/commit/079ce1085d54ff9269b62b5053c44aab30eb5ef8))
* golint installation ([63e5418](https://github.com/Jasviers/actions/commit/63e541822856d33c3e91f1db1162deeae33d7866))
* now whole code are in principal pipelines ([16cf689](https://github.com/Jasviers/actions/commit/16cf689ceeb298c15d47dc40642735d70bafa5e5))
* only execute workflows on call or on dispatch ([f98cad3](https://github.com/Jasviers/actions/commit/f98cad31467a99f6d1d58818856983643bf13da2))
* **python:** reformat main.py ([aec968e](https://github.com/Jasviers/actions/commit/aec968e72409cef59086a45f15dd3e6db561c8a3))
