# Low Volume Engulfing Indicator

The Low Volume Engulfing Indicator is a custom MetaTrader 5 (MT5) indicator that identifies bullish and bearish engulfing patterns with a condition on volume. This indicator plots arrows on the chart to signal potential buy and sell opportunities based on the engulfing pattern and volume condition.

## Features

- Identifies bullish and bearish engulfing patterns.
- Checks for lower volume on the engulfing candle.
- Plots arrows on the chart to signal buy and sell opportunities.
- Customizable arrow codes and vertical shifts.

## Installation

1. Download the `Low_Volume_Engulfing.mq5` file.
2. Open the MetaTrader 5 platform.
3. Go to `File` -> `Open Data Folder`.
4. Navigate to `MQL5` -> `Indicators`.
5. Copy the `Low_Volume_Engulfing.mq5` file into the `Indicators` folder.
6. Restart the MetaTrader 5 platform.
7. In the Navigator window, find the `Low_Volume_Engulfing` indicator under `Indicators`.
8. Drag and drop the indicator onto a chart.

## Inputs

### Arrows
- `Inp_BUY_ArrowCode`: Arrow code for buy signals (default: 116, Wingdings font).
- `Inp_BUY_ArrowShift`: Vertical shift for buy arrows in pixels (default: 10).
- `Inp_SELL_ArrowCode`: Arrow code for sell signals (default: 116, Wingdings font).
- `Inp_SELL_ArrowShift`: Vertical shift for sell arrows in pixels (default: 10).

## Indicator Buffers

- `BUYBuffer[]`: Buffer for buy signals.
- `SELLBuffer[]`: Buffer for sell signals.

## Functions

### `OnInit()`
Initializes the indicator, sets up the buffers, and configures the arrow properties.

### `OnCalculate(const int rates_total, const int prev_calculated, const datetime &time[], const double &open[], const double &high[], const double &low[], const double &close[], const long &tick_volume[], const long &volume[], const int &spread[])`
Calculates the indicator values, checks for engulfing patterns and volume conditions, and updates the buffers with buy and sell signals.

## Example Usage

1. Attach the `Low_Volume_Engulfing` indicator to a chart.
2. Customize the input parameters as needed.
3. Observe the arrows plotted on the chart indicating potential buy and sell opportunities.

## License

This indicator is provided under the MetaQuotes Software Corp. license. For more information, visit [MetaQuotes Software Corp.](https://www.mql5.com).

## Disclaimer

Trading in the financial markets involves risk. This indicator is provided for informational purposes only and should not be considered as financial advice. Always do your own research before making any trading decisions.

---

For more information, visit the [MetaQuotes Software Corp.](https://www.mql5.com) website.