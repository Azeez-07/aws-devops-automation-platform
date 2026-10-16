
#!/bin/bash
set -eu

cd "$(dirname "$0")/.."

echo "Starting CI validation..."

test -f app/index.html || {
    echo "Missing app/index.html"
    exit 1
}

test -f docker/Dockerfile || {
    echo "Missing docker/Dockerfile"
    exit 1
}

command -v docker >/dev/null 2>&1 || {
    echo "Docker is not installed on the Jenkins agent"
    exit 1
}

: "${CI_IMAGE:?CI_IMAGE environment variable is required}"

docker build -t "$CI_IMAGE" -f docker/Dockerfile .

echo "Docker image built successfully: $CI_IMAGE"

