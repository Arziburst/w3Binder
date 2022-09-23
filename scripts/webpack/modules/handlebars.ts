// Core
import webpack, { Configuration } from 'webpack';

export const loadHandlebars = (): Configuration => ({
    module: {
        rules: [
            {
                test:   /\.handlebars$/,
                loader: 'handlebars-loader',
            },

        ],
    },
    plugins: [
        new webpack.LoaderOptionsPlugin({
            options: {
                handlebarsLoader: {},
            },
        }),
    ],
});

