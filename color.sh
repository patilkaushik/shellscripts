Colors() {
	
    Escape="\033";

    BlackF="${Escape}[30m";   RedF="${Escape}[31m";   GreenF="${Escape}[32m";
    YellowF="${Escape}[33m";  BlueF="${Escape}[34m";    Purplef="${Escape}[35m";
    CyanF="${Escape}[36m";    WhiteF="${Escape}[37m";

    BlackB="${Escape}[40m";     RedB="${Escape}[41m";     GreenB="${Escape}[42m";
    YellowB="${Escape}[43m";    BlueB="${Escape}[44m";    PurpleB="${Escape}[45m";
    CyanB="${Escape}[46m";      WhiteB="${Escape}[47m";

    Reset="${Escape}[0m";
	
	if [ $# -gt 0 ]; then
		echo -e "Below variables are available for respective colour \n ${BlackF}BlackF\t${RedF}RedF\t${GreenF}GreenF\t${YellowF}YellowF\t${BlueF}BlueF\t${Purplef}Purplef\t${CyanF}CyanF\t${WhiteF}WhiteF\t\n ${Reset}${BlackB}BlackB\t${RedB}RedB\t${GreenB}GreenB\t${YellowB}YellowB\t${BlueB}BlueB\t${PurpleB}PurpleB\t${CyanB}CyatB\t${WhiteB}WhiteB\t${Reset}"
	fi
}
