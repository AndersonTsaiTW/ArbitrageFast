-- Create options table
CREATE TABLE IF NOT EXISTS options (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(20) NOT NULL,
    strike_price DECIMAL(10,2) NOT NULL,
    expiration_date DATE NOT NULL,
    option_type VARCHAR(4) NOT NULL,
    last_price DECIMAL(10,2),
    bid_price DECIMAL(10,2),
    ask_price DECIMAL(10,2),
    volume INTEGER,
    open_interest INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create underlying assets table
CREATE TABLE IF NOT EXISTS underlying_assets (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(20) NOT NULL,
    last_price DECIMAL(10,2) NOT NULL,
    volume INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create arbitrage opportunities table
CREATE TABLE IF NOT EXISTS arbitrage_opportunities (
    id SERIAL PRIMARY KEY,
    option_id INTEGER REFERENCES options(id),
    underlying_id INTEGER REFERENCES underlying_assets(id),
    profit_potential DECIMAL(10,2) NOT NULL,
    strategy_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'active'
);

-- Create indexes
CREATE INDEX idx_options_symbol ON options(symbol);
CREATE INDEX idx_options_expiration ON options(expiration_date);
CREATE INDEX idx_underlying_symbol ON underlying_assets(symbol); 