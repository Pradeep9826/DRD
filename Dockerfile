FROM tensorflow/tensorflow:2.12.0

WORKDIR /app

# Copy requirements and install
COPY requirements.txt ./
RUN python -m pip install --upgrade pip setuptools wheel && \
    python -m pip install --no-cache-dir -r requirements.txt

# Copy app source
COPY . /app

ENV PYTHONUNBUFFERED=1

# Streamlit default port
EXPOSE 8501

# Run the Streamlit app by default
CMD ["streamlit", "run", "app3.py", "--server.port", "8501", "--server.address", "0.0.0.0"]
