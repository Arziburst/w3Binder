// Core
import merge from 'webpack-merge';

// Constants
import { SOURCE_DIRECTORY, BUILD_DIRECTORY } from '../constants';

// Modules
import * as modules from '../modules';

export const getCommonConfig = () => {
    return merge(
        {
            entry:  [ SOURCE_DIRECTORY ],
            output: {
                path:                BUILD_DIRECTORY,
                filename:            'js/index.js',
                chunkFilename:       'js/[name].[hash].chunk.js',
                publicPath:          '/',
                assetModuleFilename: 'assets/[name][ext]',
                hashDigestLength:    5,
            },
            resolve: {
                extensions: [ '.ts', '.js' ],
            },
        },
        modules.loadTypeScript(),
        modules.loadHandlebars(),
        modules.defineEnvVariables(),
        modules.connectHtml(),
    );
};
