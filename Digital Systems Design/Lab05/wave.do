onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /part2/A
add wave -noupdate /part2/B
add wave -noupdate /part2/C
add wave -noupdate /part2/D
add wave -noupdate /part2/F
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {947 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 1000ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/part2/A 
wave create -driver freeze -pattern clock -initialvalue 0 -period 500ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/part2/B 
wave create -driver freeze -pattern clock -initialvalue 0 -period 250ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/part2/C 
wave create -driver freeze -pattern clock -initialvalue 0 -period 125ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/part2/D 
WaveCollapseAll -1
wave clipboard restore
