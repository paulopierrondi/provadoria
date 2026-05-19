import http.server
import socketserver
import os

PORT = int(os.environ.get("PORT", 8000))

class Handler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-cache, no-store, must-revalidate")
        super().end_headers()

    def do_GET(self):
        if self.path in ["/privacy", "/terms", "/support"]:
            self.path = self.path + ".html"
        return super().do_GET()

os.chdir("/usr/share/nginx/html")

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serving at port {PORT}")
    httpd.serve_forever()
