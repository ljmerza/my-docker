# Use an official Python runtime as a base image
FROM resin/rpi-raspbian:latest

# Set the working directory to /app
WORKDIR /app

# install python
RUN apt-get update && apt-get install python3 python3-pip

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip3 install -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python3", "app.py"]