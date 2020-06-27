from flask import Flask, request
from os import path, getcwd
import subprocess

app = Flask(__name__)

@app.route('/hotspot/<status>')
def hotspot(status):
  return subprocess.run([f'echo "bash networkHandler.sh -h {status}" > networkHandlerPipe'],
    capture_output=True,
    shell=True).stdout


def restart_wlan0():
  return subprocess.run('echo "bash networkHandler.sh -r 1" > networkHandlerPipe',
    shell=True,
    capture_output=True)


@app.route('/wifi_creds')
def wifi_creds():
  ssid = request.args.get('ssid', None)
  key = request.args.get('key', None)

  # open wpa_supplicant.conf and write creds to it
  if ssid and key:
    try:
      subprocess.run(f'echo "bash networkHandler.sh -s {ssid} -k {key}" > networkHandlerPipe',
        shell=True,
        capture_output=True)
      restart_wlan0()
      return "Success: wpa_supplicant.conf updated"
    except:
      return "Unknown error, unable to configure wpa_supplicant.conf"
  else:
    return "SSID and Key were not provided"
  

if __name__ == '__main__':
  app.run(debug=True, host='0.0.0.0', port=5001)