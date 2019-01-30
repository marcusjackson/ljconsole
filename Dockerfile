FROM python:3
RUN apt-get update -qq
ADD /python /python
WORKDIR /python