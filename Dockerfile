# Use Ubuntu as the base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Set environment variable for tzdata to prevent prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y tzdata make git python3.12-full && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy repository
COPY ./detection-rules/ /app/detection-rules/

# Set working directory to detection-rules
WORKDIR /app/detection-rules

# Debug Python installation (Optional)
RUN python3.12 --version && which python3.12

# Install dependencies and build the project
RUN make

# Activate the virtual environment and run Python command
RUN /bin/bash -c "source /app/detection-rules/env/detection-rules-build/bin/activate && \
    python3.12 -m detection_rules custom-rules setup-config /app/config"

RUN echo "source /app/detection-rules/env/detection-rules-build/bin/activate" >> ~/.bashrc \
source ~/.bashrc

# Default command to keep container running interactively
ENTRYPOINT ["/bin/bash", "-c", "source /app/detection-rules/env/detection-rules-build/bin/activate && python -m detection_rules custom-rules setup-config /app/config --overwrite && tail -f /dev/null"]