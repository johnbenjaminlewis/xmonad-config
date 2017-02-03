Config {
    font = "xft:Fixed-11",
    bgColor = "#000000",
    fgColor = "#ffffff",
    lowerOnStart = False,
    overrideRedirect = False,
    position = Static { xpos = 0, ypos = 0, width = 3200, height = 72 },
    commands = [
        Run Memory ["-t","Mem: <usedratio>%"
                   ,"-H","8192"
                   ,"-L","4096"
                   ,"-h","#FFB6B0"
                   ,"-l","#CEFFAC"
                   ,"-n","#FFFFCC"]
                   10,
        Run Network "wlp58s0" ["-t","Net: <rx>, <tx>"
                              ,"-H","1000000"
                              ,"-L","1024"
                              ,"-h","#FFB6B0"
                              ,"-l","#CEFFAC"
                              ,"-S","True"
                              ,"-n","#FFFFCC"]
                              10,
        Run Date "(%A) %b %_d %l:%M %p" "date" 60,
        Run BatteryP ["BAT0"]
                     ["--template", "<acstatus><left>% (<timeleft>)",
                      "-L", "10",
                      "-H", "80",
                      "-p", "3",
                      "--",
                      "-O", "<fc=#CEFFAC>Charging</fc> - ",
                      "-i", "<fc=#FFFFCC>Plugged in</fc> - ",
                      "-o", "<fc=#FFB6B0>Discharging</fc> - ",
                      "-L", "-15",
                      "-H", "-5",
                      "-l", "red",
                      "-m", "blue",
                      "-h", "green"]
                      60,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %wlp58s0% | %battery% | %memory% | <fc=#FFFFCC>%date%</fc>"
}
