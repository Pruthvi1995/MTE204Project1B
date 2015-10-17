function [ nodes, props, sctr, forces ] = importData( nodesFile, propsFile, sctrFile, forcesFile )

    nodes = csvread(nodesFile);
    props = csvread(propsFile);
    sctr = csvread(sctrFile);
    forces = csvread(forcesFile);
end

