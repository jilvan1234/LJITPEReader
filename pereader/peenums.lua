
local enum = require("pereader.enum")

local DirectoryID = enum {
    IMAGE_DIRECTORY_ENTRY_EXPORT          = 0;   -- Export Directory
    IMAGE_DIRECTORY_ENTRY_IMPORT          = 1;   -- Import Directory
    IMAGE_DIRECTORY_ENTRY_RESOURCE        = 2;   -- Resource Directory
    IMAGE_DIRECTORY_ENTRY_EXCEPTION       = 3;   -- Exception Directory
    IMAGE_DIRECTORY_ENTRY_SECURITY        = 4;   -- Security Directory
    IMAGE_DIRECTORY_ENTRY_BASERELOC       = 5;   -- Base Relocation Table
    IMAGE_DIRECTORY_ENTRY_DEBUG           = 6;   -- Debug Directory
--      IMAGE_DIRECTORY_ENTRY_COPYRIGHT       7;   -- (X86 usage)
    IMAGE_DIRECTORY_ENTRY_ARCHITECTURE    = 7;   -- Architecture Specific Data
    IMAGE_DIRECTORY_ENTRY_GLOBALPTR       = 8;   -- RVA of GP
    IMAGE_DIRECTORY_ENTRY_TLS             = 9;   -- TLS Directory
    IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG    = 10;   -- Load Configuration Directory
    IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT   = 11;   -- Bound Import Directory in headers
    IMAGE_DIRECTORY_ENTRY_IAT            = 12;   -- Import Address Table
    IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT   = 13;   -- Delay Load Import Descriptors
    IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR = 14;   -- COM Runtime descriptor
}

local DllCharacteristics = enum {
    IMAGE_DLL_RESERVED1 = 0x1,
    IMAGE_DLL_RESERVED2 = 0x2,
    IMAGE_DLL_RESERVED3 = 0x4,
    IMAGE_DLL_RESERVED4 = 0x8,
    IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE = 0x40,
    IMAGE_DLL_CHARACTERISTICS_FORCE_INTEGRITY = 0x80,
    IMAGE_DLL_CHARACTERISTICS_NX_COMPAT = 0x100,
    IMAGE_DLLCHARACTERISTICS_NO_ISOLATION = 0x200,
    IMAGE_DLLCHARACTERISTICS_NO_SEH = 0x400,
    IMAGE_DLLCHARACTERISTICS_NO_BIND = 0x800,
    IMAGE_DLL_RESERVED5 = 0x1000,
    IMAGE_DLLCHARACTERISTICS_WDM_DRIVER = 0x2000,
    IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE = 0x8000,
}

local Subsystem = enum {
    IMAGE_SUBSYSTEM_UNKNOWN = 0x0,
    IMAGE_SUBSYSTEM_NATIVE = 0x1,
    IMAGE_SUBSYSTEM_WINDOWS_GUI = 0x2,
    IMAGE_SUBSYSTEM_WINDOWS_CUI = 0x3,
    IMAGE_SUBSYSTEM_POSIX_CUI = 0x7,
    IMAGE_SUBSYSTEM_WINDOWS_CE_GUI = 0x9,
    IMAGE_SUBSYSTEM_EFI_APPLICATION = 0x10,
    IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER = 0x11,
    IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER = 0x12,
    IMAGE_SUBSYSTEM_EFI_ROM = 0x13,
    IMAGE_SUBSYSTEM_XBOX = 0x14,
}

local OptHeaderMagic = enum {
    IMAGE_MAGIC_HEADER_PE32 = 0x10b,
    IMAGE_MAGIC_HEADER_PE32_PLUS = 0x20b,
}

local Characteristics = enum {
    IMAGE_FILE_RELOCS_STRIPPED          = 0x0001,
    IMAGE_FILE_EXECUTABLE_IMAGE         = 0x0002,
    IMAGE_FILE_LINE_NUMS_STRIPPED       = 0x0004,
    IMAGE_FILE_LOCAL_SYMS_STRIPPED      = 0x0008,
    IMAGE_FILE_AGGRESSIVE_WS_TRIM       = 0x0010,
    IMAGE_FILE_LARGE_ADDRESS_AWARE      = 0x0020,
    IMAGE_FILE_BYTES_REVERSED_LO        = 0x0080,
    IMAGE_FILE_32BIT_MACHINE            = 0x0100,
    IMAGE_FILE_DEBUG_STRIPPED           = 0x0200,
    IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP  = 0x0400,
    IMAGE_FILE_NET_RUN_FROM_SWAP        = 0x0800,
    IMAGE_FILE_SYSTEM                   = 0x1000,
    IMAGE_FILE_DLL                      = 0x2000,
    IMAGE_FILE_UP_SYSTEM_ONLY           = 0x4000,
    IMAGE_FILE_BYTES_REVERSED_HI        = 0x8000,
}

local MachineType = enum {
    IMAGE_FILE_MACHINE_UNKNOWN = 0x0,
    IMAGE_FILE_MACHINE_ARM = 0x1c0,
    IMAGE_FILE_MACHINE_ARMN = 0x1c4,
    IMAGE_FILE_MACHINE_AM33 = 0x1d3,
    IMAGE_FILE_MACHINE_I386 = 0x14c,
    IMAGE_FILE_MACHINE_R4000 = 0x166,
    IMAGE_FILE_MACHINE_WCEMIPSV2 = 0x169,
    IMAGE_FILE_MACHINE_SH3 = 0x1a2,
    IMAGE_FILE_MACHINE_SH3D = 0x1a3,
    IMAGE_FILE_MACHINE_SH4 = 0x1a6,
    IMAGE_FILE_MACHINE_SH5 = 0x1a8,
    IMAGE_FILE_MACHINE_THUMB = 0x1c2,
    IMAGE_FILE_MACHINE_POWERPC = 0x1f0,
    IMAGE_FILE_MACHINE_POWERPCFP = 0x1f1,
    IMAGE_FILE_MACHINE_IA64 = 0x200,
    IMAGE_FILE_MACHINE_MIPS1 = 0x266,
    IMAGE_FILE_MACHINE_MIPSF = 0x366,
    IMAGE_FILE_MACHINE_MIPSF = 0x466,
    IMAGE_FILE_MACHINE_EBC = 0xebc,
    IMAGE_FILE_MACHINE_AMD64 = 0x8664,
    IMAGE_FILE_MACHINE_M32R = 0x9041,
    IMAGE_FILE_MACHINE_ARM6 = 0xaa64,
}



local exports = {
    DirectoryID         = DirectoryID;
    DllCharacteristics  = DllCharacteristics,
    Subsystem           = Subsystem,
    OptHeaderMagic      = OptHeaderMagic,
    Characteristics     = Characteristics,
    MachineType         = MachineType,
}

setmetatable(exports, {
    __call = function(self, ...)
        for k,v in pairs(exports) do
            _G[k] = v;
        end
    end,
    })


return exports
