ARG IMAGE=intersystemsdc/irishealth-community:latest

FROM $IMAGE
USER root
WORKDIR /opt/irisapp

# Update package and install sudo
RUN apt-get update && apt-get install -y \
	nano \
	python3-pip \
	python3-venv \
	sudo && \
	/bin/echo -e ${ISC_PACKAGE_MGRUSER}\\tALL=\(ALL\)\\tNOPASSWD: ALL >> /etc/sudoers && \
	sudo -u ${ISC_PACKAGE_MGRUSER} sudo echo enabled passwordless sudo-ing for ${ISC_PACKAGE_MGRUSER}

# create dev directory
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
USER ${ISC_PACKAGE_MGRUSER}

# Copy source files to image
COPY . /opt/irisapp

# load demo
RUN iris start IRIS \
	&& iris session IRIS < /opt/irisapp/iris.script && iris stop IRIS quietly

# create Python env
ENV PYTHON_PATH=/usr/irissys/bin/irispython
ENV SRC_PATH=/opt/irisapp
ENV IRISUSERNAME "SuperUser"
ENV IRISPASSWORD "SYS"
ENV IRISNAMESPACE "USER"
#ENV PATH "/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin"

# Requirement for embedded python
RUN pip3 install -r ${SRC_PATH}/src/Python/requirements.txt

# Install Native API
# For now Native API wheel is not embedded in container
COPY misc/intersystems_irispython-3.2.0-py3-none-any.whl /usr/irissys/dev/python/intersystems_irispython-3.2.0-py3-none-any.whl
RUN pip3 install /usr/irissys/dev/python/intersystems_irispython-3.2.0-py3-none-any.whl