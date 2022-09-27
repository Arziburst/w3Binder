import { CLIGen } from 'burst-generate-files';
import pkg from 'app-root-path';

CLIGen(pkg.path, [
    {
        name:      'unitData Human',
        templates: [
            {
                stringsReplacers: '__unitName__',
                pathToTemplate:   './scripts/generate/unitData',
                outputPath:       './src/data/units/human',
                markers:          [
                    {
                        pattern:        '// unitImportJsonMarker',
                        pathToMarker:   './src/data/units/human/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitImportJsonMarker.ts',
                    },
                    {
                        pattern:        '// unitJsonMarker',
                        pathToMarker:   './src/data/units/human/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitJsonMarker.ts',
                    },
                ],
            },
        ],
    },
    {
        name:      'unitData Orc',
        templates: [
            {
                stringsReplacers: '__unitName__',
                pathToTemplate:   './scripts/generate/unitData',
                outputPath:       './src/data/units/orc',
                markers:          [
                    {
                        pattern:        '// unitImportJsonMarker',
                        pathToMarker:   './src/data/units/orc/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitImportJsonMarker.ts',
                    },
                    {
                        pattern:        '// unitJsonMarker',
                        pathToMarker:   './src/data/units/orc/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitJsonMarker.ts',
                    },
                ],
            },
        ],
    },
    {
        name:      'unitData Undead',
        templates: [
            {
                stringsReplacers: '__unitName__',
                pathToTemplate:   './scripts/generate/unitData',
                outputPath:       './src/data/units/undead',
                markers:          [
                    {
                        pattern:        '// unitImportJsonMarker',
                        pathToMarker:   './src/data/units/undead/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitImportJsonMarker.ts',
                    },
                    {
                        pattern:        '// unitJsonMarker',
                        pathToMarker:   './src/data/units/undead/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitJsonMarker.ts',
                    },
                ],
            },
        ],
    },
    {
        name:      'unitData Night Elf',
        templates: [
            {
                stringsReplacers: '__unitName__',
                pathToTemplate:   './scripts/generate/unitData',
                outputPath:       './src/data/units/nightElf',
                markers:          [
                    {
                        pattern:        '// unitImportJsonMarker',
                        pathToMarker:   './src/data/units/nightElf/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitImportJsonMarker.ts',
                    },
                    {
                        pattern:        '// unitJsonMarker',
                        pathToMarker:   './src/data/units/nightElf/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitJsonMarker.ts',
                    },
                ],
            },
        ],
    },
    {
        name:      'unitData Neutral',
        templates: [
            {
                stringsReplacers: '__unitName__',
                pathToTemplate:   './scripts/generate/unitData',
                outputPath:       './src/data/units/neutral',
                markers:          [
                    {
                        pattern:        '// unitImportJsonMarker',
                        pathToMarker:   './src/data/units/neutral/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitImportJsonMarker.ts',
                    },
                    {
                        pattern:        '// unitJsonMarker',
                        pathToMarker:   './src/data/units/neutral/index.ts',
                        markerTemplate: './scripts/generate/unitData/.genignore/unitJsonMarker.ts',
                    },
                ],
            },
        ],
    },
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
