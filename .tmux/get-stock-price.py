import json
import sys
from urllib.request import urlopen


DEFAULT_PREVIOUS_CLOUSE = 27


# print("--")
# sys.exit(0)

def get_price(ticker):
    try:
        yahoo_finance_url = f"https://query1.finance.yahoo.com/v8/finance/chart/{ticker}?region=US&lang=en-US&includePrePost=false&interval=2m&range=1d"
        response = urlopen(yahoo_finance_url)
        r = json.loads(response.read())
        current = r['chart']['result'][0]['meta']['regularMarketPrice']
        previous_close_price = DEFAULT_PREVIOUS_CLOUSE if 'previousClose' not in r['chart']['result'][0]['meta'] else r['chart']['result'][0]['meta']['previousClose']
        change = 100 * ((current / previous_close_price) - 1 )
        price_change = current - previous_close_price
    except Exception:
        change = 0.0
        current = 0.0
        price_change = 0.0

    return float(current), float(change), float(price_change)

stock_current, stock_change, stock_price_change = get_price(sys.argv[2])

try:
    if stock_change < 0:
        color = "#[fg=red,bold]"
    else:
        color = "#[fg=green,bold]"

    if sys.argv[3] == "yes":
        # print("{}{}: ${:,.2f} · {:.2f}% · ${:.2f}".format(color, sys.argv[1], float(stock_current), float(stock_change), float(stock_price_change)))
        print("{}${:,.2f} · {:.2f}%".format(color, float(stock_current), float(stock_change)))
    else:
        print("{}{:.2f}%".format(color, float(stock_change)))

except Exception:
    print("no connection")
