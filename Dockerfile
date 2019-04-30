FROM python:3.6-slim

RUN apt-get update && apt-get install -y \
  qt5-default mpv lame portaudio19-dev \
  pyqt5-dev-tools libcurl4-nss-dev \
  freetype2-demos libfreetype6 libfreetype6-dev \
  gcc make

RUN pip3 install PyQt5 PyQtWebEngine

COPY . /anki

RUN cd /anki && ./tools/build_ui.sh

RUN cd /anki &&\
  pip3 install -r requirements.txt

WORKDIR /anki

ENTRYPOINT ["make", "-f", "dev.mk", "run"]
