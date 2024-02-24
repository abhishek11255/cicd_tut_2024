# FROM python:3.10-slim

# ENV APP_HOME /app
# WORKDIR $APP_HOME
# COPY . ./

# RUN pip install --no-cache-dir -r requirements.txt

# CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app


FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

ENV PORT 8080


# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the Python script
# CMD ["python", "main.py"]

CMD exec gunicorn --bind :$PORT --workers 1  main:app
