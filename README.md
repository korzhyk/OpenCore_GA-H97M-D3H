# Hackintosh on Gigabyte GA-H97M-D3H (GA-H97-D3H-CF) via [OpenCore][opencore]

![About this mac][100]

_macOS Supported:_ **10.15+**

### Hardware configuration

- Intel Core i7 4770S
- Gigabyte GA-H97M-D3H (also suitable with GA-H97-D3H-CF)
- 4×8GB Crucial Ballistix 1600MHz
- Samsung 840 EVO 128GB (macOS)
- AirPort Extreme BCM94360CS2

### Before you start make sure you have

- Working hardware
- [BIOS][bios] version `>= F7`
- [OpenCore][opencore] `= 0.8.0`
- Populated `PlatformInfo > Generic` section in `config.plist`, can be easyly done with `GenSMBIOS` please follow [OpenCore Desktop Guide][ocdg]. This config uses `iMac16,1` as model. `USBMap.kext & USBMapLegacy.kext` and `PlatformInfo > Generic` section in `config.plist` are dependencies of it.

## Installation

### BIOS Settings

[BIOS Features][102] and [Peripherals][103]

- _Save & Exit_ → Load Optimized Defaults [**Yes**]
- _BIOS Features_ → Fast boot [**Disabled**]
- _BIOS Features_ → VT-d [**Enabled**]
- _BIOS Features_ → Windows 8 Features [**Windows 8 WHQL**]
- _BIOS Features_ → CSM Support [**Disabled**]
- _Peripherals_ → Initial Display Output [**IGFX**]
- _Peripherals_ → XHCI Mode [**Enabled**]
- _Peripherals_ → Intel Processor Graphics Memory Allocation [**64M**]
- _Peripherals_ → XHCI Hand-off [**Enabled**]
- _Peripherals_ → EHCI Hand-off [**Enabled**]
- _Peripherals_ → Super IO Configuration → Serial Port A [**Disabled**]

### What's behind the scenes

- You must download all not bundled kexts and drivers from repositories by yourself.
- `CFG-Lock / MSR 0xE2` option is [**UNLOCKED**][104].

#### Kexts

- `USBMap.kext & USBMapLegacy.kext` - Plist-only kext for USB port mapping
- [RealtekR1000SL.kext][realteklanv3] - Another intel driver for Ethernet
- [AppleALC.kext][applealc] - Getting audio to work as easy-peasy `layout-id = 1` defined in `SSDT-EXT.aml`
- [Lilu.kext][lilu] - Dependency of `VirtualSMC.kext` and `WhateverGreen.kext`
- [VirtualSMC.kext][virtualsmc] - A advanced replacement of FakeSMC, almost like native mac SMC.
- [WhateverGreen.kext][whatevergreen] - Need for iGPU support

### EFI drivers

- ~VirtualSMC.efi~ - only needed if you use File Vault 2 or [authrestart][filevault].

## Issues

1. The limit of USB ports is `15` but it counts not only physical but also protocol based. So if one physical port can be used by two protocols such as 3.0 (SS) and 2.0 (HS), in this way in system he actually own two of fifteen addresses (eg. HS01/SS01). You can see the real USB mapping in this [picture][105]. Due to these limits disabled interfaces are `HS05, HS06, HS13, SS03 and SS04`. Also internal USB 2.0 header `HS14` is utilized by Broadcom BCM4360 combo module for Bluetooth device.

## GA-H97-D3H-CF compatible

To support this config you need replace ethernet kext `RealtekR1000SL.kext` with `AppleIntelE1000e.kext` and modify path in `config.plist`.

## Chnagelog

###### 08/05/2022

- Update config for OpenCore v0.8.0
- Replaced AML with DSL SSDT-EXT

###### 22/11/2021

- Update config for OpenCore v0.7.5

###### 23/09/2021

- Update config for OpenCore v0.7.3

###### 3/02/2021

- Update config for OpenCore v0.6.6

###### 13/12/2020

- Update config for OpenCore v0.6.4

###### 15/11/2020

- Update config for OpenCore v0.6.3
- Rename USB mappings kext

###### 8/09/2020

- Update config for OpenCore v0.6.1

###### 6/09/2020

- Update config for OpenCore v0.6.0

###### 2/06/2020

- Update config for OpenCore v0.5.9

###### 22/05/2020

- Update config for OpenCore v0.5.8
- Removed `ApfsDriverLoader.efi`, already bundled in OpenCore v0.5.8
- Added `UEFI → APFS` section in `config.plist`
- Config clean up

###### 23/04/2020

- Initial release

[opencore]: https://github.com/acidanthera/OpenCorePkg
[applealc]: https://github.com/acidanthera/AppleALC
[lilu]: https://github.com/acidanthera/Lilu
[virtualsmc]: https://github.com/acidanthera/VirtualSMC
[whatevergreen]: https://github.com/acidanthera/WhateverGreen
[filevault]: https://lifehacker.com/bypass-a-filevault-password-at-startup-by-rebooting-fro-1686770324
[ocdg]: https://dortania.github.io/OpenCore-Desktop-Guide/config.plist/haswell.html#platforminfo
[realteklanv3]: https://github.com/SergeySlice/RealtekLANv3
[iso_codes]: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements
[bios]: https://www.gigabyte.com/Motherboard/GA-H97M-D3H-rev-10/support#support-dl-bios
[100]: https://i.imgur.com/H3B3jVf.png 'Abount this mac'
[101]: https://i.imgur.com/qvrlikU.png 'Intel power gadget'
[102]: https://i.imgur.com/a7BNhng.png 'BIOS Features'
[103]: https://i.imgur.com/eNrUYy8.png 'BIOS Peripherals'
[104]: https://i.imgur.com/7PonWQi.png 'MSR 0xE2 off'
[105]: https://i.imgur.com/VmtWM3U.png 'USB Mapping'
