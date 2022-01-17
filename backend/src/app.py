from flask import Flask, request, jsonify
import RPi.GPIO as GPIO
import board
import neopixel

app = Flask(__name__)
NUMPIXELS = 30
GPIO.setwarnings(True)
GPIO.setmode(GPIO.BCM) 
pixels = neopixel.NeoPixel(board.D18, NUMPIXELS)

@app.route("/")
def hello_world():
    return "<p>Hell World!!</p>"

@app.route("/led", methods=['POST'])
def change_led_color():
    try:
        payload = request.json
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
    
