
###################################################################################

# Add IncTemplate to system dump service
sysdmp_add -name PNET -show PnetSysDump

echo -text "Starting Profinet and installs the driver/networks"

# INC DRIVER INSTALLATION:

# Debug from installation
# 768 = Hex 300
# 7425 = Hex 1D01
# 7168 = Hex 1c00
# 8190 = Hex 1FFE
# 0x10000 = Startup
#invoke2 -entry uprobe_console_trace -format int -int1 1
#invoke2 -entry eioevent_trace -format int -int1 7168
#invoke2 -entry inc_trace -format int -int1 8190
#invoke -entry PnetTrace -arg 0x10000 -nomode

# Spawn driver tasks
task -slotname PN_Tick -entp PnetTick -pri 44 -vwopt 0x1c -stcks 5000 -nosync -auto -noreg
task -slotname PnetReadts -entp PnetTaskRead -pri 72 -vwopt 0x1c -stcks 18000 -nosync -auto -noreg
task -slotname Pnetts -entp PnetTask -pri 122 -vwopt 0x1c -stcks 50000 -nosync -auto -noreg
task -slotname PnetCmdts -entp PnetTaskCmd -pri 123 -vwopt 0x1c -stcks 18000 -nosync -auto -noreg

# Register driver
invoke -entry incInstallDriver -strarg "PROFINET_INC,PnetDriverEntry,PnetOutputEntry,BitMapped" -nomode

echo -text "... Done"
###################################################################################

