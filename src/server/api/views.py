from flask import Blueprint, jsonify

app = Blueprint(
    'api',
    __name__,
    url_prefix='/api'
)


@app.route('/index')
def index():
    # nop
    return jsonify({'message': 'Hello world'})
