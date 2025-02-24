//+------------------------------------------------------------------+
//|                                         Low Volume Engulfing.mq4 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql4.com"
#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 clrDeepSkyBlue
#property indicator_color2 clrOrangeRed
#property indicator_width1 1
#property indicator_width2 1

//--- input parameters
extern int Inp_BUY_ArrowCode = 233;       // Arrow 'BUY': code (font Wingdings)
extern int Inp_SELL_ArrowCode = 234;      // Arrow 'SELL': code (font Wingdings)

//--- indicator buffers
double BUYBuffer[];
double SELLBuffer[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
{
   //--- Set indicator buffers
   SetIndexBuffer(0, BUYBuffer);
   SetIndexBuffer(1, SELLBuffer);

   //--- Set arrow styles
   SetIndexStyle(0, DRAW_ARROW);
   SetIndexArrow(0, Inp_BUY_ArrowCode);
   SetIndexStyle(1, DRAW_ARROW);
   SetIndexArrow(1, Inp_SELL_ArrowCode);

   //--- Set empty value for plotting
   SetIndexEmptyValue(0, 0.0);
   SetIndexEmptyValue(1, 0.0);

   return(0);
}

//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
{
   return(0);
}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
{
   int counted_bars = IndicatorCounted();
   if(counted_bars < 0) return(-1);
   if(counted_bars > 0) counted_bars--;

   int limit = Bars - counted_bars;

   for(int i = limit - 1; i >= 0; i--)
   {
      BUYBuffer[i] = 0.0;
      SELLBuffer[i] = 0.0;

      // Check engulfing pattern and volume condition
      if(High[i] >= High[i + 1] && Low[i] <= Low[i + 1]) // Engulfing condition
      {
         if(Volume[i] < Volume[i + 1]) // Volume condition
         {
            if(Open[i] < Close[i]) // Bullish engulfing
               BUYBuffer[i] = Low[i];
            else // Bearish engulfing
               SELLBuffer[i] = High[i];
         }
      }
   }

   return(0);
}
//+------------------------------------------------------------------+