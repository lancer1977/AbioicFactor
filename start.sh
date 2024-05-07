#!/bin/bash
xvfb-run wine64 /home/abiotic/abioticserver/AbioticFactor/Binaries/Win64/AbioticFactorServer-Win64-Shipping.exe -log -newconole -useperfthreads -NoAsyncLoadingThread -MaxServerPlayers=6 -PORT=7777 -QUERYPORT=27015 -tcp -ServerPassword=yourpassword -SteamServerName="yourserver" -WorldSaveName="Cascade"
