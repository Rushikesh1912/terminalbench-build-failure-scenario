FROM python:3.12-slim

WORKDIR /app

# Copy project files
COPY project/ /app/

# Intentionally DO NOT install required system dependencies
# lxml requires:
#   libxml2-dev
#   libxslt-dev
#   build-essential

CMD ["bash"]