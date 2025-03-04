#!/bin/bash
VM_NAME=$(curl -H 'Metadata-Flavor: Google' http://metadata.google.internal/computeMetadata/v1/instance/name)
echo "<p>Served from ${VM_NAME}</p>" > /usr/share/nginx/html/vm_info.html
exec "$@"
