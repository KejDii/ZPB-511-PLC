%https://docs.google.com/spreadsheets/d/1olxOslALs8F1HbiT0loRb5fLyf3bNweiijAWc2UgHmw/edit?gid=0#gid=0
clear; clc;
iterations=300000;
K=1000;
czasy=zeros(K,1);
flopsy=zeros(K,1);

for k = 1:K
A=1;
B=-1;
C=-1;
D=-1;
t=tic;
for i=1:iterations
    A=(A+B+C-D)*0.499975;
    B=(A+B-C+D)*0.499975;
    C=(A-B+C+D)*0.499975;
    D=(-A+B+C+D)*0.499975;
end
czas=toc(t);
FLOPS=iterations*16/czas;

czasy(k)=czas;
flopsy(k)=FLOPS;
end

srednia_czas=mean(czasy)
srednia_flopsy=mean(flopsy)

%iteracje*(flop na iter=16)/czas

