import { CLIGen } from 'burst-generate-files';
import pkg from 'app-root-path';

CLIGen(pkg.path, [
    {
        name:      'Component',
        templates: [
            {
                stringsReplacers: '__componentName__',
                pathToTemplate:   './scripts/generate/component',
                outputPath:       './src/components',
                markers:          [
                    {
                        pattern:        '// reExportComponentMarker',
                        pathToMarker:   './src/components/index.ts',
                        markerTemplate: './scripts/generate/component/.genignore/reExportComponentMarker.ts',
                    },
                ],
            },
        ],
    },
    {
        name:      'Element',
        templates: [
            {
                stringsReplacers: '__elementName__',
                pathToTemplate:   './scripts/generate/element',
                outputPath:       './src/elements',
                markers:          [
                    {
                        pattern:        '// reExportElementsMarker',
                        pathToMarker:   './src/elements/index.ts',
                        markerTemplate: './scripts/generate/element/.genignore/reExportElementMarker.ts',
                    },
                ],
            },
        ],
    },
]);
