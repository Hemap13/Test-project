# this is my base image to build the docker for  automation 190923
FROM python:3.8-slim-buster

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV AUTOMATION=True
WORKDIR /opt/venv/app

# install postgres client
RUN apt-get update -qq && apt-get install -y postgresql-client gcc libsasl2-dev python-dev libldap2-dev libssl-dev
# ENV PATH="/usr/bin:${PATH}" 

# install Python modules needed by the Python app
COPY requirements.txt .
COPY .coveragerc .
RUN pip install --no-cache-dir -r requirements.txt

# copy files required for the app to run
COPY src/*.py src/
COPY *.pem /opt/venv/app/
COPY *.sh /opt/venv/app/

RUN chmod 755 start.sh

# tell the port number the container should expose
EXPOSE 9111

# run the application
ENTRYPOINT ./start.sh
