# Hackintosh on Gigabyte GA-H97M-D3H (GA-H97-D3H-CF) via [OpenCore][1]

![About this mac][100]

*macOS Supported:* **10.13+**

### Hardware configuration

* Intel Core i7 4770S
* Gigabyte GA-H97M-D3H (also suitable with GA-H97-D3H-CF)
* 2×8GB Crucial Ballistix 1600MHz
* Samsung 840 EVO 128GB (macOS)
* Broadcom BCM4360 802.11а/b/g/n/ac Wireless Network Adapter with Bluetooth 4.0

### Before you start make sure you have

* Working hardware
* [BIOS][15] version `>= F7`
* [OpenCore][1] `= 0.5.8`
* Populated `PlatformInfo > Generic` section in `config.plist`, can be easyly done with `GenSMBIOS` please follow [OpenCore Desktop Guide][7]. This config uses `iMac14,1` as model. `USBH97M-D3H.kext` and `PlatformInfo > Generic` section in `config.plist` are dependencies of it.

## Installation

### BIOS Settings

[BIOS Features][102] and [Peripherals][103]
* *Save & Exit* → Load Optimized Defaults [**Yes**]
* *BIOS Features* → Fast boot [**Disabled**]
* *BIOS Features* → VT-d [**Enabled**]
* *BIOS Features* → Windows 8 Features [**Windows 8 WHQL**]
* *BIOS Features* → CSM Support [**Disabled**]
* *Peripherals* → Initial Display Output [**IGFX**]
* *Peripherals* → XHCI Mode [**Enabled**]
* *Peripherals* → Intel Processor Graphics Memory Allocation [**64M**]
* *Peripherals* → XHCI Hand-off [**Enabled**]
* *Peripherals* → EHCI Hand-off [**Enabled**]

### What's behind the scenes

* You must download all not bundled kexts and drivers from repositories by yourself.
* `CFG-Lock / MSR 0xE2` option is [**UNLOCKED**][104].

#### Kexts

* USBH97M-D3H.kext - Plist-only kext for USB port mapping
* [RealtekR1000SL.kext][8] - Another intel driver for Ethernet
* [AppleALC.kext][2] - Getting audio to work as easy-peasy `layout-id = 1` defined in `SSDT-EXT.aml`
* [Lilu.kext][3] - Dependency of `VirtualSMC.kext` and `WhateverGreen.kext`
* [VirtualSMC.kext][4] - A advanced replacement of FakeSMC, almost like native mac SMC.
* [WhateverGreen.kext][5] - Need for iGPU support

### EFI drivers

* OpenRuntime.efi - Must have to work with native NVRAM
* ~VirtualSMC.efi~ - only needed if you use File Vault 2 or [authrestart][6].

## Issues

1. The limit of USB ports is `15` but it counts not only physical but also protocol based. So if one physical port can be used by two protocols such as 3.0 (SS) and 2.0 (HS), in this way in system he actually own two of fifteen addresses (eg. HS01/SS01). You can see the real USB mapping in this [picture][105]. Due to these limits disabled interfaces are `HS05, HS06, HS13, SS03 and SS04`. Also internal USB 2.0 header `HS14` is utilized by Broadcom BCM4360 combo module for Bluetooth device.

## GA-H97-D3H-CF compatible

To support this config you need replace ethernet kext `RealtekR1000SL.kext` with `AppleIntelE1000e.kext` and modify path in `config.plist`.

## Chnagelog
###### 22/08/2020
* Update config for OpenCore v0.5.8
* Removed `ApfsDriverLoader.efi`, already bundled in OpenCore v0.5.8
* Added `UEFI → APFS` section in `config.plist`
* Config clean up
###### 23/04/2020
* Initial release

[1]: https://github.com/acidanthera/OpenCorePkg
[2]: https://github.com/acidanthera/AppleALC
[3]: https://github.com/acidanthera/Lilu
[4]: https://github.com/acidanthera/VirtualSMC
[5]: https://github.com/acidanthera/WhateverGreen

[6]: https://lifehacker.com/bypass-a-filevault-password-at-startup-by-rebooting-fro-1686770324
[7]: https://dortania.github.io/OpenCore-Desktop-Guide/config.plist/haswell.html#platforminfo
[8]: https://github.com/SergeySlice/RealtekLANv3
[13]: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements
[14]: https://github.com/acidanthera/MacInfoPkg
[15]: https://www.gigabyte.com/Motherboard/GA-H97M-D3H-rev-10/support#support-dl-bios

[100]: https://i.imgur.com/2JDWZlX.png "Abount this mac"
[101]: https://i.imgur.com/qvrlikU.png "Intel power gadget"
[102]: https://i.imgur.com/a7BNhng.png "BIOS Features"
[103]: https://i.imgur.com/eNrUYy8.png "BIOS Peripherals"
[104]: https://i.imgur.com/7PonWQi.png "MSR 0xE2 off"
[105]: https://i.imgur.com/VmtWM3U.png "USB Mapping"
