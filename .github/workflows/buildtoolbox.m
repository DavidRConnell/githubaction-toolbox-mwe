function buildtoolbox(toolboxFolder, outDir, version)
    versionNumber = regexp(version, "v(\d+\.\d+\.\d+)", "tokens");
    if isempty(versionNumber)
        % For testing builds outside of a tagged release.
        versionNumber = "0.0.0";
    else
        versionNumber = versionNumber{1};
    end

    releaseName = strjoin(['mwe', version], '_');

    uuid = "e100c63a-9d55-4527-9e0b-a43d8ff89d03";
    opts = matlab.addons.toolbox.ToolboxOptions(toolboxFolder, uuid);

    opts.ToolboxName = "githubactions-mwe";
    opts.ToolboxVersion = versionNumber;
    opts.ToolboxGettingStartedGuide = fullfile(toolboxFolder, ...
                                               "GettingStarted.mlx");

    opts.AuthorName = "David R. Connell";
    opts.Summary = "Minimum working example of using github actions to deploy a MATLAB toolbox.";

    if ~exist(outDir, "dir")
        mkdir(outDir);
    end
    opts.OutputFile = fullfile(outDir, releaseName);

    opts.MinimumMatlabRelease = "R2019b";
    opts.MaximumMatlabRelease = "";

    matlab.addons.toolbox.packageToolbox(opts);
end
