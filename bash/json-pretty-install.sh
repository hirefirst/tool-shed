#!/bin/bash

RESET="\e[0m"
YELLOW="\e[93m"
GREEN="\e[32m"
RED="\e[31m"
BOLD="\e[1m"
INVERT="\e[7m"
ERR=0

errorMessage() {
    echo -e "${BOLD}${YELLOW}${INVERT} Error ${RESET} no value set for ${BOLD}${YELLOW}${1}${RESET}"
}

echo -e ""
echo -e "This script would install you command ${YELLOW}${BOLD}json-pretty${RESET}";
echo -e ""
echo -e "Do you want to ${GREEN}continue${RESET} (${YELLOW}${BOLD}yes${RESET}|no)?"
read CONSENT
CONSENT=`echo "$CONSENT" | tr '[:upper:]' '[:lower:]'`
if [[ "$CONSENT" != "yes" && "$CONSENT" != "YES" ]]
then
    echo ""
    echo "Installation interrupted."
    exit 1
else
    echo "#!/bin/bash" > ./json-pretty
    echo "" >> ./json-pretty
    echo "if [ -z \"\$1\" ]" >> ./json-pretty
    echo "then" >> ./json-pretty
    echo "" >> ./json-pretty
    echo "" >> ./json-pretty
    echo "echo \"Error: No JSON file specified...\"" >> ./json-pretty
    echo "    echo \"Use: \"" >> ./json-pretty
    echo "    echo \" json-pretty [your-filename]\"" >> ./json-pretty
    echo "    echo \"\"" >> ./json-pretty
    echo "    exit 1" >> ./json-pretty
    echo "fi" >> ./json-pretty
    echo "cat \$1 | python -m json.tool" >> ./json-pretty
    echo "exit 0" >> ./json-pretty
    sudo chmod 777 ./json-pretty
    sudo chown nobody ./json-pretty
    sudo chmod +x ./json-pretty
    sudo mv ./json-pretty /usr/bin/
fi
exit 0
