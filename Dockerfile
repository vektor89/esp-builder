FROM debian
RUN apt-get update && apt-get -y install git libusb-1.0 python3 python3-venv && mkdir /espressif && cd /espressif && git clone -b v5.4.2 --depth 1 --recursive --shallow-submodules https://github.com/espressif/esp-idf.git && mkdir idf_tools && IDF_TOOLS_PATH=./idf_tools esp-idf/install.sh esp32 && git clone --depth 1 --recursive --shallow-submodules https://github.com/espressif/esp-adf.git
ADD prepare.sh /espressif
ENV IDF_TOOLS_PATH=/espressif/idf_tools
