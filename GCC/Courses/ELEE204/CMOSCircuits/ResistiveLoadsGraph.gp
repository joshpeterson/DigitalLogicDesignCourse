# This script will produce an eps output.  Use epstopdf to convert it for input to pdflatex.
set terminal postscript eps enhanced color
set output "ResistiveLoadsGraph.eps"
set xrange [0:1000]
set yrange [0:5]
set key top left vertical Left
VoutHIGH(R) = 3.33*(100/(100+R))
VoutLOW(R) = 3.33+(5-3.33)*(R/(200+R))
set xlabel "Thevenin Resistance ({/Symbol W})"
set ylabel "Voltage (V)"
set label 1 "HIGH" at 500,4 center
set label 2 "ABNORMAL" at 500,2.5 center
set label 4 "LOW" at 500,1 center
set title "CMOS Inverter V_{out} for varying resistive loads (from section 3.5.2 of Wakerly)"
plot [10:1000] VoutHIGH(x) ti "V_{out}(R_{Thev}), H", VoutLOW(x) ti "V_{out}(R_{Thev}), L", 0.3*5 ti "V_{ILmax}", 0.7*5 ti "V_{IHmin}"
