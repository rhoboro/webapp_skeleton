from flask import Flask
from . import api

app = Flask(__name__, instance_relative_config=True)
app.config.from_object('config.default')
app.config.from_envvar('APP_CONFIG_FILE')

blueprints = [api]
for blueprint in blueprints:
    app.register_blueprint(blueprint.app)
