FROM python:3-alpine

WORKDIR /app

# Install requirements
COPY ./src/requirements.txt .
RUN pip install --upgrade --no-cache-dir --requirement requirements.txt

# Create user
RUN addgroup --system --gid 1001 streamlink
RUN adduser --system --uid 1001 streamlink

# Set volume
VOLUME [ "/output" ]

# Copy entrypoint.sh and give it execution permissions
COPY --chown=streamlink:streamlink ./src/entrypoint.sh .
RUN ["chmod", "+x", "/app/entrypoint.sh"]

USER streamlink
ENTRYPOINT [ "/app/entrypoint.sh" ]
