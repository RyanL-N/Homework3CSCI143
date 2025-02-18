# Use Ubuntu as the base image
FROM ubuntu:20.04

# Set maintainer info (optional)
LABEL maintainer="Ryan Lee-Nguyen  Rylee@students.pitzer.edu"

# Update package lists and install Python, pip, and dependencies
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Set the working directory
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY . /app/

# Expose port 5000
EXPOSE 5056

# Run the Flask app
CMD ["python3", "app.py"]
