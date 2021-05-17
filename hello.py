import requests

def main():
    request = requests.get('https://api.chucknorris.io/jokes/random')
    if request.status_code == 200:
        data = request.json()
        print(data['value'])
    else:
        print("Could not get quote")


if __name__ == "__main__":
    main()
