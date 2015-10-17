clear all;
close all;

nodesFile = 'nodes1.txt';
propsFile = 'props1.txt';
sctrFile = 'sctr1.txt';
massNodesFile = 'mNodes1.txt';
initialsFile = 'initials.txt';
sSys = 0;


[nodes, props, sctr, initials] = importData(nodesFile, propsFile, sctrFile, initialsFile);
initials
if (props(1, 3) == 0)
    sSys = 1;
    mNodes = csvread(massNodesFile);
end 

[n, type] = size(nodes); %type is 2; assumption that 2 nodes per element
e = size(sctr, 1); %number of elements
Y = eye(2*type);
Kglobal = zeros(type*n);
Cglobal = zeros(type*n);
Mglobal = zeros(type*n);
Fglobal = assembleF(initials, n);
[U, U1, U2] = assembleU(initials, n);
for el = 1:e
    ind1 = sctr(el, 1);
    ind2 = sctr(el, 2);
    x2 = nodes(ind2, 1);
    x1 = nodes(ind1, 1);
    y2 = nodes(ind2, 2);
    y1 = nodes(ind1, 2);
    
    len = sqrt((y2-y1)^2+(x2-x1)^2);
    X = getStiffnessMatrix((x2-x1)/len, (y2-y1)/len);
    Klocal = X*(props(el, 1)*props(el, 2)/len);
    Clocal = X*props(el, 4);
    if (sSys == 0)
        Mlocal = Y*(props(el, 2)*props(el, 3)*len*.5);
    end

    n1 = sctr(el, 1);
    n2 = sctr(el, 2);
    Kglobal (n1*2-1:n1*2,n1*2-1:n1*2) = Kglobal (n1*2-1:n1*2,n1*2-1:n1*2)+Klocal([1,2],[1,2]);
    Kglobal (n1*2-1:n1*2,n2*2-1:n2*2) = Kglobal (n1*2-1:n1*2,n2*2-1:n2*2)+Klocal([1,2],[3,4]);
    Kglobal (n2*2-1:n2*2,n1*2-1:n1*2) = Kglobal (n2*2-1:n2*2,n1*2-1:n1*2)+Klocal([3,4],[1,2]);
    Kglobal (n2*2-1:n2*2,n2*2-1:n2*2) = Kglobal (n2*2-1:n2*2,n2*2-1:n2*2)+Klocal([3,4],[3,4]);

    Cglobal (n1*2-1:n1*2,n1*2-1:n1*2) = Cglobal (n1*2-1:n1*2,n1*2-1:n1*2)+Clocal([1,2],[1,2]);
    Cglobal (n1*2-1:n1*2,n2*2-1:n2*2) = Cglobal (n1*2-1:n1*2,n2*2-1:n2*2)+Clocal([1,2],[3,4]);
    Cglobal (n2*2-1:n2*2,n1*2-1:n1*2) = Cglobal (n2*2-1:n2*2,n1*2-1:n1*2)+Clocal([3,4],[1,2]);
    Cglobal (n2*2-1:n2*2,n2*2-1:n2*2) = Cglobal (n2*2-1:n2*2,n2*2-1:n2*2)+Clocal([3,4],[3,4]);
    
    if (sSys == 0)
        Mglobal (n1*2-1:n1*2,n1*2-1:n1*2) = Mglobal (n1*2-1:n1*2,n1*2-1:n1*2)+Mlocal([1,2],[1,2]);
        Mglobal (n1*2-1:n1*2,n2*2-1:n2*2) = Mglobal (n1*2-1:n1*2,n2*2-1:n2*2)+Mlocal([1,2],[3,4]);
        Mglobal (n2*2-1:n2*2,n1*2-1:n1*2) = Mglobal (n2*2-1:n2*2,n1*2-1:n1*2)+Mlocal([3,4],[1,2]);
        Mglobal (n2*2-1:n2*2,n2*2-1:n2*2) = Mglobal (n2*2-1:n2*2,n2*2-1:n2*2)+Mlocal([3,4],[3,4]);
    end
end
if (sSys == 1)
    for i = 1:n
        Mglobal(2*i-1, 2*i-1) = mNodes(i);
        Mglobal(2*i, 2*i) = mNodes(i);
    end
end
Kglobal, Cglobal, Mglobal, Fglobal






%uFunc ( F, m, k, c, t, v0, u0)
%uFunc(10, 10, 10, 1, 5, 0, 1)
