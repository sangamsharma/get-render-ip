# Use Python 3.10 slim as base image
FROM python:3.10-slim

# Set noninteractive installation to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Ensure logs are output immediately
ENV PYTHONUNBUFFERED=1

# Command to run the script
CMD ["python", "get_ip.py"]
