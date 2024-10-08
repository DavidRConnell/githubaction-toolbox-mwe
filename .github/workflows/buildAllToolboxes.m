function buildAllToolboxes(artifactsDir, outDir, version)
    tmpDir = "tmp/mwe";
    compiledFileDirs = {"+mwe/private"};
    for d = dir(artifactsDir + "/mwe*")'
        toolboxDir = fullfile(artifactsDir, d(1).name, "mwe", "toolbox");
        zipFile = dir(fullfile(artifactsDir, d(1).name, ...
                               "mwe-toolbox_" + version + "*"));
        arch = regexp(zipFile.name, version + '_(.*)-toolbox', "tokens");

        if ~exist(tmpDir, 'dir')
            mkdir(tmpDir);
            copyfile(toolboxDir, fullfile(tmpDir, "toolbox"));
        else
            for mexDir = compiledFileDirs
                copyfile(fullfile(toolboxDir, mexDir{1}, ...
                                  "*." + archmexext(arch{1}{1})), ...
                         fullfile(tmpDir, "toolbox", mexDir{1}));
                if startsWith(arch{1}{1}, "win")
                    copyfile(fullfile(toolboxDir, mexDir{1}, "*.dll"), ...
                             fullfile(tmpDir, "toolbox", mexDir{1}));
                elseif startsWith(arch{1}{1}, "gln")
                    copyfile(fullfile(toolboxDir, mexDir{1}, "lib"), ...
                             fullfile(tmpDir, "toolbox", mexDir{1}));
                end
            end
        end
    end

    buildtoolbox(fullfile(tmpDir, "toolbox"), outDir, version);
end

function ext = archmexext(arch)
    ext = 'notfound';
    extList = mexext('all');
    for i = 1:length(extList)
       if strcmp(arch, extList(i).arch)
           ext = extList(i).ext;
           return
       end
    end
end
