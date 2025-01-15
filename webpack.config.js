import path from 'path';

/** @type {import('webpack').Configuration} */
const extensionConfig = {
    target: 'node',
    mode: 'none',
    entry: './src/extension.ts',
    output: {
        path: path.resolve('./dist'),
        filename: 'extension.js',
        libraryTarget: 'commonjs2',
    },
    externals: {
        vscode: 'commonjs vscode',
    },
    resolve: {
        extensions: ['.ts', '.js'],
    },
    module: {
        rules: [
            {
                test: /\.ts$/,
                exclude: /node_modules/,
                use: [{ loader: 'ts-loader' }],
            },
        ],
    },
    stats: {
        errorDetails: true,
    },
    devtool: 'source-map',
    infrastructureLogging: {
        level: 'log',
    },
};

export default extensionConfig;
