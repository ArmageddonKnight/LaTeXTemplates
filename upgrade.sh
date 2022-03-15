#!/bin/bash -e

for template in ICLR IEEEtran NeurIPS USENIX acmSigConf
do
        printf "****************************************************************\n"
        printf "* ${template}\n"
        printf "****************************************************************\n"

        cp -r extra_pkgs.tex docker-compose.yml dockerfiles ${template}
        cd ${template}
        make upgrade
        git add -A
        git commit -m "Upgrading template" && git push
        cd ..
done

git commit -am "Upgrading templates" && git push
