# Use a specific version of Ubuntu as a parent image
FROM ubuntu:22.04

# Install Python and Pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY . .

# Make port 80 available to the world outside this container
# EXPOSE 80

# Define environment variable
ENV ORG_NAME MyOrganization

# Run the application
CMD ["python3", "run.py"]
 