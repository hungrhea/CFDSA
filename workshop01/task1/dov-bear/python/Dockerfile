# getting base image
FROM python:3.9

### BUILD THE APPLICATION ###

# define build arguments
ARG APP_DIR=/app

# create the directory /app and cd app
WORKDIR ${APP_DIR}
# already inside /app directory

# copy files into the container
COPY main.py .
COPY requirements.txt .
COPY run.sh .
COPY utils.py .

# when copying a directory in, need to specify a directory name to prevent flattening of contents into the current working dir
COPY public public
COPY templates templates

# rule of thumb: don't copy in any compiled artifacts

# install dependencies (RUN: what to execute during the container buiding process)
RUN pip install -r requirements.txt


### HOW TO RUN THE APPLICATION ###

# define environment variables
ENV PORT=3000
ENV INSTANCE_NAME=""
ENV INSTANCE_HASH=""

# tells Docker which port the application is listening on, use environment variable already defined previously
EXPOSE ${PORT}

# run the application (ENTRYPOINT: what to execute when container starts)
CMD python main.py


