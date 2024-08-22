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
    export("toolbox/GettingStarted.mlx", "docs/content/start/_index.md");
end
