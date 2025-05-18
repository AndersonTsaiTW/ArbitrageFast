const yahooFinance = require('yahoo-finance2').default;

async function testYahooFinance() {
  try {
    // // 取得即時股票報價
    // const quote = await yahooFinance.quote('AAPL');
    // console.log('AAPL Quote:', quote);

    // // 取得期權鏈（最近一期）
    // const options = await yahooFinance.options('AAPL');
    // console.log('AAPL Options:', options);

    // 你也可以試試其他股票或 ETF
    // const msft = await yahooFinance.quote('MSFT');
    // console.log('MSFT Quote:', msft);

    const result = await yahooFinance.historical('AAPL', {
      period1: '2024-05-01',
      period2: '2024-05-01',
      interval: '1m'
    });

  } catch (error) {
    console.error('Error:', error);
  }
}

testYahooFinance();
