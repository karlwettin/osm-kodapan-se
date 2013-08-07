from gevent import pywsgi
from mapproxy.wsgiapp import make_wsgi_app

application = make_wsgi_app(r'/var/www/mapproxy/mapproxy.yaml')
server = pywsgi.WSGIServer(('', 8080), application)

server.serve_forever()
