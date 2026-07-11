# Xray VLESS+WS for Out Plane

## Deploy steps
1. Push this repo to GitHub.
2. In console.outplane.com -> Deploy Application -> select this repo.
3. Build method: Dockerfile.
4. Add environment variable:
   - CLIENT_UUID = c447a6b5-4235-4b18-b90e-1ead209c8ffb
5. Deploy. Out Plane assigns a domain with automatic HTTPS, e.g. your-app.outplane.app

## Client config (VLESS link)
vless://c447a6b5-4235-4b18-b90e-1ead209c8ffb@YOUR-APP.outplane.app:443?encryption=none&security=tls&type=ws&host=YOUR-APP.outplane.app&path=%2Fws#OutPlane

Replace YOUR-APP.outplane.app with the actual domain Out Plane gives you after deploy.

## Notes
- TLS is terminated by Out Plane at the edge; the container only speaks plain WebSocket.
- To rotate the UUID, just change the CLIENT_UUID env var and redeploy/restart.
