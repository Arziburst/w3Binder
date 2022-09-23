import { CLIGen } from 'burst-generate-files';
import pkg from 'app-root-path';

CLIGen(pkg.path, [
    {
        name:      'Component',
        templates: [
            {
                stringsReplacers: '__componentName__',
                pathToTemplate:   './scripts/generate/componentTemplate',
                outputPath:       './src/components',
                markers:          [
                    {
                        pattern:        '// reExportComponentMarker',
                        pathToMarker:   './src/components/index.ts',
                        markerTemplate: './scripts/generate/componentTemplate/.genignore/reExportComponentMarker.ts',
                    },
                ],
            },
        ],
    },
]);
