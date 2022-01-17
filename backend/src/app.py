from flask import Flask, request, jsonify, render_template
import RPi.GPIO as GPIO
import board
import neopixel
from logging.config import dictConfig

dictConfig({
    'version': 1,
    'formatters': {'default': {
        'format': '[%(asctime)s] %(levelname)s in %(module)s: %(message)s',
    }},
    'handlers': {'wsgi': {
        'class': 'logging.StreamHandler',
        'stream': 'ext://flask.logging.wsgi_errors_stream',
        'formatter': 'default'
    }},
    'root': {
        'level': 'INFO',
        'handlers': ['wsgi']
    }
})

app = Flask(__name__)
NUMPIXELS = 30
GPIO.setwarnings(True)
GPIO.setmode(GPIO.BCM) 
pixels = neopixel.NeoPixel(board.D18, NUMPIXELS)

@app.route("/")
def hello_world():
    return render_template('index.html', static_url_path='')

@app.route("/color", methods=['POST'])
def change_led_color():
    try:
        payload = request.json
        if 0 > payload["R"] or 255 < payload["R"] \
            or 0 > payload["G"] or 255 < payload["G"] \
                or 0 > payload["B"] or 255 < payload["B"]:
            raise Exception('Unexpected color range value 0 ~ 255')
        for i in range(NUMPIXELS):
            pixels[i] = (payload["R"], payload["G"], payload["B"])
        pixels.show()
        return jsonify({
            "result": "ok"
        })
    except Exception as e:
        return jsonify({
            "result": "fail",
            "message": str(e)
        })
    # if request.is_json:
    #     content = request.get_json(silent=True)
    #     return f'R: {str(content['R'])} G: {str(content['G'])} B: {str(content['B'])}'
    # else:
    #     return 'fail'