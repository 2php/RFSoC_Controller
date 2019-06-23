
 PARAMETER VERSION = 2.2.0


BEGIN OS
 PARAMETER OS_NAME = standalone
 PARAMETER OS_VER = 7.0
 PARAMETER PROC_INSTANCE = microblaze_mcs_0_microblaze_I
 PARAMETER stdin = microblaze_mcs_0_iomodule_0
 PARAMETER stdout = microblaze_mcs_0_iomodule_0
END


BEGIN PROCESSOR
 PARAMETER DRIVER_NAME = cpu
 PARAMETER DRIVER_VER = 2.9
 PARAMETER HW_INSTANCE = microblaze_mcs_0_microblaze_I
 PARAMETER compiler_flags =  -mlittle-endian -mxl-soft-mul -mno-xl-reorder -mcpu=v11.0
END


BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.3
 PARAMETER HW_INSTANCE = microblaze_mcs_0_dlmb_cntlr
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.3
 PARAMETER HW_INSTANCE = microblaze_mcs_0_ilmb_cntlr
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = iomodule
 PARAMETER DRIVER_VER = 2.7
 PARAMETER HW_INSTANCE = microblaze_mcs_0_iomodule_0
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = uartlite
 PARAMETER DRIVER_VER = 3.2
 PARAMETER HW_INSTANCE = microblaze_mcs_0_mdm_0
END


