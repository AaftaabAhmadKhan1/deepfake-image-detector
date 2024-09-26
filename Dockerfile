# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install system dependencies
RUN apt-get update && apt-get install -y unzip

# Install Python dependencies including the missing package
RUN pip install --no-cache-dir streamlit tensorflow streamlit-image-select

# Navigate to the models folder and unzip the pretrained model
RUN cd deepfake-image-detector/code/PretrainedModel/ && \
    unzip dffnetv2B0.zip

# Set the working directory to the Streamlit folder
WORKDIR /app/deepfake-image-detector/code/PretrainedModel/streamlit_deepfake_detector

# Command to run the Streamlit app
CMD ["streamlit", "run", "multipage_app.py"]
