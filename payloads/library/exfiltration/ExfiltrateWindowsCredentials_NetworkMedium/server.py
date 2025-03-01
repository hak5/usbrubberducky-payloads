#!/usr/bin/env python
import os
import http.server as server

class HTTPRequestHandler(server.SimpleHTTPRequestHandler):
    # Handle file upload via PUT request
    def do_PUT(self):
        name = os.path.basename(self.path)

        length = int(self.headers['Content-Length'])
        r = 0
        with open(name, 'wb+') as file:
            while r < length:
                n = self.rfile.read(min(66556, length - r))
                r += len(n)
                file.write(n)
        self.send_response(201, 'Created')
        self.end_headers()
        reply_body = f'Saved {name}\n'
        self.wfile.write(reply_body.encode('utf-8'))

    # Prevent file download
    def do_GET(self):
        self.send_response(404, 'Not Found')
        self.end_headers()
        self.wfile.write(b'')

if __name__ == '__main__':
    server.test(HandlerClass=HTTPRequestHandler)