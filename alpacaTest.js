import dotenv from 'dotenv';
import axios from 'axios';

import Alpaca from "@alpacahq/alpaca-trade-api";

dotenv.config();

const API_KEY = process.env.ALPACA_API_KEY;
const API_SECRET = process.env.ALPACA_API_SECRET;

// Alpaca options trades API endpoint
const BASE_URL = 'https://data.alpaca.markets/v1beta1/options/trades';

async function getOptionTrades() {
  try {
    const response = await axios.get(BASE_URL, {
      headers: {
        'APCA-API-KEY-ID': API_KEY,
        'APCA-API-SECRET-KEY': API_SECRET,
      },
      params: {
        symbols: 'AAPL250523C00222500', // Example contract symbol
        start: '2025-05-15T00:00:00Z', // Start time
        end: '2025-05-16T23:59:59Z',   // End time
        limit: 10                    // Max results
      }
    });
    console.log(response.data);
    console.log(response.data.trades);
  } catch (error) {
    console.error('Error:', error.response ? error.response.data : error.message);
  }
}

getOptionTrades();