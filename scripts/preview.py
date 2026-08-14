#!/usr/bin/env python3
"""Serve the built _site the way GitHub Pages does.

Why this exists: Font Awesome's icon glyphs are literal UTF-8 private-use
characters embedded in assets/css/main.css (there is no BOM and Ruby Sass
strips @charset in compressed mode). GitHub Pages sends
"content-type: text/css; charset=utf-8", so browsers decode them correctly.
Jekyll's built-in WEBrick server sends bare "text/css", the browser falls back
to a legacy encoding, and every sidebar icon silently disappears — which looks
like a broken site when it is only a broken preview.

This server sends an explicit charset on text assets, so what you see matches
what will actually be published.

Usage:
    bundle exec jekyll build          # or: jekyll build --watch, in another shell
    python3 scripts/preview.py        # -> http://127.0.0.1:4001
"""
import functools
import http.server
import os
import socketserver
import sys

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 4001
ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.pardir, "_site")

CHARSET_TYPES = {".css": "text/css", ".html": "text/html", ".js": "text/javascript",
                 ".svg": "image/svg+xml", ".json": "application/json", ".xml": "application/xml"}


class Handler(http.server.SimpleHTTPRequestHandler):
    def guess_type(self, path):
        ext = os.path.splitext(path)[1].lower()
        if ext in CHARSET_TYPES:
            return f"{CHARSET_TYPES[ext]}; charset=utf-8"
        return super().guess_type(path)

    def log_message(self, fmt, *args):  # keep the console quiet
        pass


if not os.path.isdir(ROOT):
    sys.exit("No _site/ directory. Run `bundle exec jekyll build` first.")

socketserver.TCPServer.allow_reuse_address = True
with socketserver.TCPServer(("127.0.0.1", PORT), functools.partial(Handler, directory=ROOT)) as httpd:
    print(f"Serving {os.path.realpath(ROOT)} at http://127.0.0.1:{PORT}  (Ctrl-C to stop)")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print()
