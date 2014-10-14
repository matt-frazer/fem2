clear all;
E = 10;
A = 1;
v = 0;
k = 10;
c = 1;
m = 10;
F = 10;

omegaN = sqrt(k./m);

zeta = c./(2.*m.*omegaN);

omegaD = omegaN.*sqrt(1-zeta.^2);

theta = atan2(zeta,(sqrt(1-zeta.^2)));

t = 0:0.01:5;

u2 = F./k - (F./(k.*sqrt(1 - zeta.^2))).*exp(-1*zeta.*omegaN.*t).*cos(omegaD.*t-theta) + exp(-1*zeta.*omegaN.*t).*(((0 + 0.*zeta.*omegaN.*1)./omegaD).*sin(omegaD.*t) + 0.*1.*cos(omegaD.*t));

plot(t,u2, '-r', 'LineWidth',8)

hold all

s = 0:0.1:5;

u2 = F./k - (F./(k.*sqrt(1 - zeta.^2))).*exp(-1*zeta.*omegaN.*s).*cos(omegaD.*s-theta) + exp(-1*zeta.*omegaN.*s).*(((0 + 0.*zeta.*omegaN.*1)./omegaD).*sin(omegaD.*s) + 0.*1.*cos(omegaD.*s));

plot(s,u2, '-g', 'LineWidth',4)



r = 0:1:5;

u2 = F./k - (F./(k.*sqrt(1 - zeta.^2))).*exp(-1*zeta.*omegaN.*r).*cos(omegaD.*r-theta) + exp(-1*zeta.*omegaN.*r).*(((0 + 0.*zeta.*omegaN.*1)./omegaD).*sin(omegaD.*r) + 0.*1.*cos(omegaD.*r));

plot(r,u2, '-b', 'LineWidth',2)
