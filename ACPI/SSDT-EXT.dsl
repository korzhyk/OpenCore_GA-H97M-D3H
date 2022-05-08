/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLKY7jvx.aml, Sun May  8 14:59:21 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000009E1 (2529)
 *     Revision         0x02
 *     Checksum         0x0B
 *     OEM ID           "KRZH"
 *     OEM Table ID     "SsdtExt"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "KRZH", "SsdtExt", 0x00000000)
{
    External (_PR_.CPU0, ProcessorObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.HDEF, DeviceObj)
    External (_SB_.PCI0.HECI, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)
    External (_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (_SB_.PCI0.RP03.PXSX, DeviceObj)
    External (_SB_.PCI0.SATA, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (GL00, IntObj)
    External (GL04, IntObj)
    External (OSYS, IntObj)

    If (_OSI ("Darwin"))
    {
        Method (DTGP, 5, NotSerialized)
        {
            If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b") /* Unknown UUID */))
            {
                If ((Arg1 == One))
                {
                    If ((Arg2 == Zero))
                    {
                        Arg4 = Buffer (One)
                            {
                                 0x03                                             // .
                            }
                        Return (One)
                    }

                    If ((Arg2 == One))
                    {
                        Return (One)
                    }
                }
            }

            Arg4 = Buffer (One)
                {
                     0x00                                             // .
                }
            Return (Zero)
        }

        Method (PMPM, 4, NotSerialized)
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x02)
            {
                "plugin-type", 
                One
            })
        }

        If (CondRefOf (\_PR.CPU0))
        {
            If ((ObjectType (\_PR.CPU0) == 0x0C))
            {
                Scope (\_PR.CPU0)
                {
                    If (_OSI ("Darwin"))
                    {
                        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                        {
                            Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }
            }
        }

        Scope (\)
        {
            OSYS = 0x07DF
            OperationRegion (GPIO, SystemIO, 0x0500, 0x3C)
            Field (GPIO, ByteAcc, NoLock, Preserve)
            {
                Offset (0x2C), 
                    ,   1, 
                GI01,   1, 
                    ,   1, 
                GI06,   1
            }
        }

        Scope (\_SB.PCI0)
        {
            Device (MCHC)
            {
                Name (_ADR, Zero)  // _ADR: Address
            }

            Device (IMEI)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x08)
                    {
                        "AAPL,slot-name", 
                        "Built In", 
                        "model", 
                        Buffer (0x1E)
                        {
                            "Intel H97 Chipset Family IMEI"
                        }, 

                        "name", 
                        Buffer (0x16)
                        {
                            "Intel IMEI Controller"
                        }, 

                        "device_type", 
                        Buffer (0x10)
                        {
                            "IMEI Controller"
                        }
                    })
                }
            }

            Device (PMCR)
            {
                Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
                Name (_STA, 0x0B)  // _STA: Status
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Memory32Fixed (ReadWrite,
                        0xFE000000,         // Address Base
                        0x00010000,         // Address Length
                        )
                })
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x08)
                    {
                        "AAPL,slot-name", 
                        Buffer (0x09)
                        {
                            "Built In"
                        }, 

                        "device_type", 
                        Buffer (0x13)
                        {
                            "ACPIPMC Controller"
                        }, 

                        "name", 
                        Buffer (0x19)
                        {
                            "Apple ACPIPMC Controller"
                        }, 

                        "model", 
                        Buffer (0x35)
                        {
                            "Intel Corporation, Series Chipset ACPIPMC Controller"
                        }
                    })
                }
            }
        }

        Scope (\_SB.PCI0.HECI)
        {
            Name (_STA, Zero)  // _STA: Status
        }

        Scope (\_SB.PCI0.HDEF)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x10)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "name", 
                    "Audio Controller", 
                    "model", 
                    Buffer (0x27)
                    {
                        "Apple High Definition Audio Controller"
                    }, 

                    "device_type", 
                    Buffer (0x11)
                    {
                        "Audio Controller"
                    }, 

                    "layout-id", 
                    Buffer (0x04)
                    {
                         0x01, 0x00, 0x00, 0x00                           // ....
                    }, 

                    "MaximumBootBeepVolume", 
                    Buffer (One)
                    {
                         0x01                                             // .
                    }, 

                    "PinConfigurations", 
                    Buffer (Zero){}, 
                    "hda-gfx", 
                    Buffer (0x0A)
                    {
                        "onboard-1"
                    }
                })
            }
        }

        Scope (\_SB.PCI0.XHC)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0E)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "name", 
                    "Intel USB Controller", 
                    "model", 
                    Buffer (0x3D)
                    {
                        "Intel Corporation, 9 Series Chipset USB xHCI Host Controller"
                    }, 

                    "device_type", 
                    Buffer (0x0F)
                    {
                        "USB Controller"
                    }, 

                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "subsystem-id", 
                    Buffer (0x04)
                    {
                         0x70, 0x72, 0x00, 0x00                           // pr..
                    }, 

                    "subsystem-vendor-id", 
                    Buffer (0x04)
                    {
                         0x86, 0x80, 0x00, 0x00                           // ....
                    }
                })
            }
        }

        Scope (\_SB.PCI0.SATA)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0E)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "name", 
                    "Intel AHCI Controller", 
                    "device-id", 
                    Buffer (0x04)
                    {
                         0x83, 0x9C, 0x00, 0x00                           // ....
                    }, 

                    "compatible", 
                    Buffer (0x0D)
                    {
                        "pci8086,9c83"
                    }, 

                    "model", 
                    Buffer (0x34)
                    {
                        "Intel Corporation, 9 Series Chipset SATA Controller"
                    }, 

                    "device_type", 
                    Buffer (0x10)
                    {
                        "AHCI Controller"
                    }
                })
            }
        }

        Scope (\_SB.PCI0.SBUS)
        {
            Device (BUS0)
            {
                Name (_CID, "smbus")  // _CID: Compatible ID
                Name (_ADR, Zero)  // _ADR: Address
                Device (DVL0)
                {
                    Name (_ADR, 0x57)  // _ADR: Address
                    Name (_CID, "diagsvault")  // _CID: Compatible ID
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If (!Arg2)
                        {
                            Return (Buffer (One)
                            {
                                 0x57                                             // W
                            })
                        }

                        Return (Package (0x02)
                        {
                            "address", 
                            0x57
                        })
                    }
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
            }
        }

        Scope (\_SB.PCI0.PEG0.PEGP)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0A)
                {
                    "AAPL,slot-name", 
                    Buffer (0x07)
                    {
                        "Slot-1"
                    }, 

                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "model", 
                    Buffer ()
                    {
                        "AirPort Extreme BCM94360CS2"
                    }, 

                    "name", 
                    Buffer (0x13)
                    {
                        "AirPort Controller"
                    }, 

                    "device_type", 
                    Buffer (0x10)
                    {
                        "AirPort Extreme"
                    }
                })
            }
        }

        Scope (\_SB.PCI0.RP03.PXSX)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x0A)
                {
                    "AAPL,slot-name", 
                    "Built In", 
                    "built-in", 
                    Buffer (One)
                    {
                         0x00                                             // .
                    }, 

                    "model", 
                    Buffer (0x2B)
                    {
                        "Realtek RTL8111F PCI Express Fast Ethernet"
                    }, 

                    "name", 
                    Buffer (0x14)
                    {
                        "Ethernet Controller"
                    }, 

                    "device_type", 
                    Buffer (0x14)
                    {
                        "Ethernet Controller"
                    }
                })
            }
        }

        Scope (\_SB.PCI0.LPCB)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x06)
                {
                    "device-id", 
                    Buffer (0x04)
                    {
                         0x43, 0x9C, 0x00, 0x00                           // C...
                    }, 

                    "name", 
                    Buffer (0x0D)
                    {
                        "pci8086,9c43"
                    }, 

                    "compatible", 
                    Buffer (0x0D)
                    {
                        "pci8086,9c43"
                    }
                })
            }

            Device (EC)
            {
                Name (_HID, "ACID0001")  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
            }
        }

        Scope (\_SB.PCI0.LPCB.H_EC)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }
        }

        Scope (\_SB.PCI0.LPCB.HPET)
        {
            Name (\_SB.PCI0.LPCB.HPET._CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQNoFlags ()
                    {0,8,11}
                Memory32Fixed (ReadWrite,
                    0xFED00000,         // Address Base
                    0x00000400,         // Address Length
                    )
            })
        }
    }
}

