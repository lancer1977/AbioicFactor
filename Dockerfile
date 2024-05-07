FROM ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
 software-properties-common lsb-release wget

RUN mkdir -pm755 /etc/apt/keyrings
RUN wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

RUN wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources

RUN dpkg --add-architecture i386
RUN apt update
RUN apt install --install-recommends winehq-staging

RUN add-apt-repository multiverse
RUN apt-add-repository non-free
RUN apt update
RUN apt install steamcmd

#RUN groupadd docker && sudo usermod -aG docker USERNAME


RUN mkdir /home/abiotic/abioticserver
#download the game via steamcmd forcing it to use the windows files (you'll get an error if you don't do this)
RUN /usr/games/steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir /home/abiotic/abioticserver +login anonymous +app_update 2857200 +quit


WORKDIR /azp

COPY ./*.sh .

RUN chmod +x *.sh

ENTRYPOINT [ "./start.sh" ]

# Referenced from https://github.com/DFJacob/AbioticFactorDedicatedServer/issues/3