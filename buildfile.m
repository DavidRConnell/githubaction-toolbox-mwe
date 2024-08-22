function plan = buildfile
    plan = buildplan(localfunctions);
    plan.DefaultTasks = "test";
end

function testTask(~)
    oldPath = addpath("toolbox");
    runtests("tests");
    path(oldPath);
end

function makeDocsTask(~)
    if ~exist("docs/content/start", "dir")
        mkdir("docs/content/start");
    end

    export("toolbox/GettingStarted.mlx", "docs/content/start/_index.md");
end
